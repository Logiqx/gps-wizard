# Project Env
. $(dirname $0)/env.sh

# Determine Tag
IMAGE_NAME=$PROJ_NAME
IMAGE_TAG=tmp

# Docker Build
DOCKER_BUILDKIT=1 docker build . --build-arg LOGIQX_DEBUG -t $IMAGE_NAME:$IMAGE_TAG

# Copy the library scripts
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/core/file_reader.py >$PROJ_DIR/python/core/file_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/core/file_writer.py >$PROJ_DIR/python/core/file_writer.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/core/track.py >$PROJ_DIR/python/core/track.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/base_reader.py >$PROJ_DIR/python/readers/base_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/fit_reader.py >$PROJ_DIR/python/readers/fit_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/gpx_reader.py >$PROJ_DIR/python/readers/gpx_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/nmea_reader.py >$PROJ_DIR/python/readers/nmea_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/oao_reader.py >$PROJ_DIR/python/readers/oao_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/sirf_reader.py >$PROJ_DIR/python/readers/sirf_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/sbn_reader.py >$PROJ_DIR/python/readers/sbn_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/sbp_reader.py >$PROJ_DIR/python/readers/sbp_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/tcx_reader.py >$PROJ_DIR/python/readers/tcx_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/readers/ubx_reader.py >$PROJ_DIR/python/readers/ubx_reader.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/writers/base_writer.py >$PROJ_DIR/python/writers/base_writer.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/writers/csv_writer.py >$PROJ_DIR/python/writers/csv_writer.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/writers/gpx_writer.py >$PROJ_DIR/python/writers/gpx_writer.py
docker run --rm --entrypoint cat $IMAGE_NAME:$IMAGE_TAG $WORK_DIR/python/writers/kml_writer.py >$PROJ_DIR/python/writers/kml_writer.py

# Clear pycache
rm -f $PROJ_DIR/python/__pycache__/*.*.pyc
