# npm install -g xml2json-command

while read line
do
  echo "$line" \
  	| xargs groovy product2url.groovy \
  	| tee urls.txt \
	| xargs curl --silent \
	| tee -a responses.txt \
	| node /opt/local/lib/node_modules/xml2json-command \
	| tee -a responses_json.txt \
	| jq -r '.ItemLookupResponse.Items.Item.OfferSummary.LowestUsedPrice.ForamttedPrice["$t"] +"\t"+ .ItemLookupResponse.Items.Item.OfferSummary.LowestNewPrice.FormattedPrice["$t"] + "\t" + .ItemLookupResponse.Items.Item.Offers.Offer.OfferListing.Price.FormattedPrice["$t"] + "\t" +.ItemLookupResponse.Items.Item.ItemAttributes.Title["$t"]' \
	| tee -a jq_output.txt \
	| perl -pe 's{\$}{}g'
#	| jq -r '.ItemLookupResponse.Items.Item.Offers.Offer.OfferListing.Price.FormattedPrice["$t"] + .ItemLookupResponse.Items.Item.' 
done < "${1:-/dev/stdin}"

