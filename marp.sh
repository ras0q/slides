#!/bin/sh

[ $# -ne 1 ] && echo "Usage: ./marp.sh ./src/<directory-name>" && exit 1
[ ! -d $1 ] && echo "Directory $1 does not exist" && exit 1

SRC_DIR=$1
DIST_DIR=./dist/$(basename $1)

docker run \
  --rm \
  -v $(pwd):/home/marp/app/ \
  -e LANG=$LANG \
  -e MARP_USER="$(id -u):$(id -g)" \
  marpteam/marp-cli -o ${DIST_DIR}/index.html $SRC_DIR
