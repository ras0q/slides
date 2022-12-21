#!/bin/sh

rm -rf ./dist/
rsync -a --exclude '*.md' ./src/ ./dist/

docker run \
  --rm \
  -v $(pwd):/home/marp/app/ \
  -e LANG=$LANG \
  -e MARP_USER="$(id -u):$(id -g)" \
  marpteam/marp-cli -o ./dist/ -I ./src/
