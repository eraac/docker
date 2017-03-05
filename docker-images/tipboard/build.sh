#!/bin/sh

git clone https://github.com/Eraac/tipboard.git
docker build -t eraac/tipboard . --force-rm
rm -rf tipboard

