cat - \
	| grep -v 'images.amazon.com' \
	| grep -v 'images-na.ssl-images-amazon.com' \
	| grep -v 'amazonaws.com/images' \
	| grep -v 'webservices.amazon.com' \
	| grep -v 'amazonaws.com' \
	| grep 'amazon\.' \
	| grep -v 'amazon.com/forum/' \
	| grep -v '.amazon.com/review/' \
	| grep -v '.amazon.com/s/ref' \
	| grep -v 'amazon.com/gp/b2b/reports' \
	| tee amazon_product_urls_filtered.txt \
	| perl -pe 's{.*dp/(.*?)([/\?].*)?}{$1}g' \
	| perl -pe 's{.*gp/aw/d/(.*?)[/\?].*}{$1}g' \
	| perl -pe 's{.*product/(.*?)/.*}{$1}g'	\
	| perl -pe 's{/ref.*}{}g' \
	| perl -pe 's{[?/].*}{}g'
	