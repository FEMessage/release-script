#!/bin/sh
set -e
repos=(data-list el-select-area upload-to-ali el-data-table el-semver-input img-preview v-editor el-data-tree vue-sfc-cli el-form-renderer excel-it el-number-range nuxt-element-dashboard)

for i in ${repos[@]}
do
  ./git-update.sh $i
done
