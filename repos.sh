repos=$@
if [ $# -eq 0 ]
then
  repos=(data-list el-select-area upload-to-ali el-data-table el-semver-input img-preview v-editor el-data-tree vue-sfc-cli el-form-renderer excel-it el-number-range create-nuxt-app v-img vant)
fi
echo ${repos[@]}
