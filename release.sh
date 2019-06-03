#!/bin/sh
set -e
source ./repos.sh

for i in ${repos[@]}
do
  ./git-update.sh $i
done
