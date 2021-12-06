repos=$@
if [ $# -eq 0 ]
then
  echo "please input project name"
  exit 1
fi
echo fetching releases: ${repos[@]}
