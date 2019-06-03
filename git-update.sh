#!/bin/sh
set -e
dir=$1
echo "--------------- to push dir: $dir ---------------"
cd $dir
git co dev
git pull
git co master
git pull
git merge dev -m "Merge branch 'dev'"
git ps
git co dev
