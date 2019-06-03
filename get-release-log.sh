#!/bin/sh
set -e
source ./repos.sh

resp_tmp_file=resp.tmp

date=`date +%Y-%m-%d`
release_file="release.$date.md"

# 初始化文件/清空内容
echo '' > $release_file

for i in ${repos[@]}
do
  url="https://api.github.com/repos/FEMessage/$i/releases/latest"
  if [ "$i" == "nuxt-element-dashboard" ]
  then
		# pc端框架仓库地址在另一个地方
    url="https://api.github.com/repos/levy9527/nuxt-element-dashboard/releases/latest"
  fi
  curl $url > $resp_tmp_file
  html_url=`cat $resp_tmp_file | sed -n 5p | sed 's/\"html_url\"://g' | awk -F '"' '{print $2}'`
  body=`cat $resp_tmp_file | grep body | sed 's/\"body\"://g;s/\"//g'`
	title=`echo $html_url | cut -d '/' -f 5`
	echo "#[$title]($html_url)" >> $release_file
	echo $body >> $release_file
done

rm $resp_tmp_file
