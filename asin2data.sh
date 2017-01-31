# npm install -g xml2json-command

while read line
do
  echo "$line" \
  	| xargs groovy product2url.groovy \
  	| tee urls.txt \
	| xargs curl --silent \
	| tee responses.txt \
	| node /opt/local/lib/node_modules/xml2json-command \
	| tee responses_json.txt 
done < "${1:-/dev/stdin}"

