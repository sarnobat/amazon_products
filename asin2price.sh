# npm install -g xml2json-command

while read line
do
  echo "$line" \
  	| xargs groovy product2url.groovy \
	| xargs curl --silent \
	| node /opt/local/lib/node_modules/xml2json-command \
	| jq -r '.ItemLookupResponse.Items.Item.Offers.Offer.OfferListing.Price.FormattedPrice["$t"] + "\t" +.ItemLookupResponse.Items.Item.ItemAttributes.Title["$t"]' \
	| perl -pe 's{\$}{}g'
#	| jq -r '.ItemLookupResponse.Items.Item.Offers.Offer.OfferListing.Price.FormattedPrice["$t"] + .ItemLookupResponse.Items.Item.' 
done < "${1:-/dev/stdin}"

