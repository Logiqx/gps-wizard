# Project Env
. $(dirname $0)/env.sh

# Determine Tag
IMAGE_NAME=$PROJ_NAME
IMAGE_TAG=tmp

# Docker Build
DOCKER_BUILDKIT=1 docker build . --build-arg LOGIQX_DEBUG -t $IMAGE_NAME:$IMAGE_TAG

# Copy the library scripts
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/common_core.py >$PROJ_DIR/python/common_core.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/file_reader.py >$PROJ_DIR/python/readers/file_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/generic_reader.py >$PROJ_DIR/python/readers/generic_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/sbp_reader.py >$PROJ_DIR/python/readers/sbp_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/sbn_reader.py >$PROJ_DIR/python/readers/sbn_reader.py

# Clear pycache
rm -f $PROJ_DIR/python/__pycache__/*.*.pyc
