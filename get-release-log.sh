#!/bin/sh
set -e
source ./repos.sh

resp_tmp_file=resp.tmp

date=`date +%Y-%m-%d`
last_week=$(date -v-7d "+%Y-%m-%d")
release_file="release.$date.md"

# 初始化文件/清空内容
echo "# $date" > $release_file

for i in ${repos[@]}
do
  url="https://api.github.com/repos/FEMessage/$i/releases/latest"
  curl $url > $resp_tmp_file
	
  published_at=$(grep published_at $resp_tmp_file | sed 's/\"published_at\"://g' | awk -F '"' '{print $2}' | cut -d 'T' -f 1)
  # https://unix.stackexchange.com/questions/361758/subtract-7-days-from-todays-date/361762#361762?newreg=65b9567ce86b47d490429859c8bd9bcb
  
  # https://stackoverflow.com/questions/27429653/date-comparison-in-bash
  if [[ $published_at > $last_week || $published_at == $last_week ]]
  then
    html_url=$(sed -n 5p $resp_tmp_file | sed 's/\"html_url\"://g' | awk -F '"' '{print $2}')
    body=$(grep body < $resp_tmp_file | sed 's/\"body\"://g;s/\"//g')
    title=$(echo $html_url | cut -d '/' -f 5)
    version=$(echo $html_url | awk -F '/' '{print $NF}')

    echo "## [$title $version]($html_url)" >> $release_file
    echo $body >> $release_file
  else
    echo "skip $i because it has no update in last week"
  fi
done

rm $resp_tmp_file
