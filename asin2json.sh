: ${AWS_ACCESS_KEY_ID?"AWS_ACCESS_KEY_ID not set"}
: ${AWS_SECRET_ACCESS_KEY?"AWS_SECRET_ACCESS_KEY not set"}
: ${1?"no ASIN passed"}
ASIN=$1
which xml2json >/dev/null || pip install https://github.com/hay/xml2json/zipball/master
echo $ASIN | xargs groovy product2url.groovy | xargs curl --silent | xml2json | perl -pe 's/\{http.*?2011-08-01\}//g' | jq '.' 
