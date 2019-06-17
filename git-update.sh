#!/bin/sh
set -e
dir=$1
echo "--------------- to push dir: $dir ---------------"
cd $dir
git stash save
git checkout dev
git pull
git checkout master
git pull
git merge dev -m "Merge branch 'dev'"
git push
git checkout dev
