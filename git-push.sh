#!/bin/sh
set -e
dir=$1
echo "to push dir: $dir"
cd $dir
git pull
git co master
git merge dev
git ps
git co dev
