URL=${1:B002P3OCRC}
#echo $URL
echo $URL | xargs sh asin2json.sh | sh json2img.sh