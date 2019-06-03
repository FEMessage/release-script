#!/bin/sh
set -e

repos=(data-list el-select-area upload-to-ali el-data-table el-semver-input img-preview v-editor el-data-tree vue-sfc-cli el-form-renderer excel-it el-number-range)

resp_tmp_file=resp.tmp

date=`date +%Y-%m-%d`
release_file="release.$date.md"

# 初始化文件/清空内容
echo '' > $release_file

for i in ${repos[@]}
do
  url="https://api.github.com/repos/FEMessage/$i/releases/latest"
  curl $url > $resp_tmp_file
  html_url=`cat $resp_tmp_file | sed -n 5p | sed 's/\"html_url\"://g' | awk -F '"' '{print $2}'`
  body=`cat $resp_tmp_file | grep body | sed 's/\"body\"://g;s/\"//g'`
	echo $html_url >> $release_file
	echo $body >> $release_file
done

# 获取pc端框架发布日志
# 没有统一仓库地址的锅😂
url="https://api.github.com/repos/levy9527/nuxt-element-dashboard/releases/latest"
curl $url > $resp_tmp_file
html_url=`cat $resp_tmp_file | sed -n 5p | sed 's/\"html_url\"://g' | awk -F '"' '{print $2}'`
body=`cat $resp_tmp_file | grep body | sed 's/\"body\"://g;s/\"//g'`
rm $resp_tmp_file

echo $html_url >> $release_file
echo $body >> $release_file
