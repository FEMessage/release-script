#!/bin/sh
set -e
dir=$1
echo "--------------- to push project: $dir ---------------"
cd $dir
git stash save
git checkout dev
git pull origin dev
git checkout master
git pull origin master
git merge dev --no-ff -m "Merge branch 'dev'"
git push --set-upstream origin master --no-verify
git checkout dev
