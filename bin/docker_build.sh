# Project Env
. $(dirname $0)/env.sh

# Determine Tag
IMAGE_NAME=$PROJ_NAME
IMAGE_TAG=$(git rev-parse --short=12 HEAD)

# Docker Build
DOCKER_BUILDKIT=1 docker build . --build-arg LOGIQX_DEBUG -t $IMAGE_NAME:$IMAGE_TAG

# Run unit tests
run_py_script core/file_reader.py
run_py_script core/file_writer.py
run_py_script core/track.py
run_py_script readers/base_reader.py
run_py_script readers/fit_reader.py
run_py_script readers/gpx_reader.py
run_py_script readers/nmea_reader.py
run_py_script readers/oao_reader.py
run_py_script readers/sirf_reader.py
run_py_script readers/sbn_reader.py
run_py_script readers/sbp_reader.py
run_py_script readers/ubx_reader.py
run_py_script writers/base_writer.py
run_py_script writers/csv_writer.py
run_py_script writers/gpx_writer.py
run_py_script writers/kml_writer.py

# Docker Tag
docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:latest
