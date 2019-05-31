#!/bin/sh
repos=(data-list el-select-area upload-to-ali el-data-table el-semver-input img-preview v-editor el-data-tree vue-sfc-cli el-form-renderer excel-it el-number-range nuxt-element-dashboard)

for i in ${repos[@]}
do
  cd $i
	git pull
	git co master
	git merge dev
	git ps
	git co dev
done
