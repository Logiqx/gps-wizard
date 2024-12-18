# Base image versions
ARG NOTEBOOK_VERSION=notebook-6.4.6
ARG PYTHON_VERSION=3.10
ARG DEBIAN_VERSION=bullseye

# Jupyter notebook image is used as the builder
FROM jupyter/base-notebook:${NOTEBOOK_VERSION} AS builder

# Copy the required project files
WORKDIR /home/jovyan/work/gps-wizard
COPY --chown=jovyan:users python/core/*.*py* ./python/core/
COPY --chown=jovyan:users python/readers/*.*py* ./python/readers/
COPY --chown=jovyan:users python/writers/*.*py* ./python/writers/

# Convert Jupyter notebooks to regular Python scripts
RUN jupyter nbconvert --to python python/core/*.ipynb python/readers/*.ipynb python/writers/*.ipynb && \
    rm python/core/*.ipynb python/readers/*.ipynb python/writers/*.ipynb

# Ensure project file permissions are correct
RUN chmod 755 python/core/*.py python/readers/*.py python/writers/*.py

# Create final image from Python 3 (Debian Slim)
FROM python:${PYTHON_VERSION}-slim-${DEBIAN_VERSION}

# Note: Jovian is a fictional native inhabitant of the planet Jupiter
ARG PY_USER=jovyan
ARG PY_GROUP=jovyan
ARG PY_UID=1000
ARG PY_GID=1000

# Create the Python user and work directory
RUN groupadd -g ${PY_GID} ${PY_GROUP} && \
    useradd -u ${PY_UID} ${PY_USER} -g ${PY_GROUP} && \
    mkdir -p /home/${PY_USER}/work && \
    chown -R ${PY_USER} /home/${PY_USER}

# Install Tini
RUN apt-get update && apt-get install -y --no-install-recommends tini=0.19.* \
    && rm -rf /var/lib/apt/lists/*

# Install scientific libraries
RUN pip install --no-cache-dir \
    matplotlib==3.5.* \
    numpy==1.21.* \
    scipy==1.7.*

# Install GPS + fitness tracker libraries
RUN pip install --no-cache-dir \
    fitdecode==0.10.* \
    lxml==4.7.*

# Copy project files from the builder
USER ${PY_USER}
WORKDIR /home/${PY_USER}/work/gps-wizard
COPY --from=builder --chown=jovyan:jovyan /home/jovyan/work/gps-wizard/ ./
RUN mkdir data docs

# Wait for CMD to exit, reap zombies and perform signal forwarding
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["python"]
