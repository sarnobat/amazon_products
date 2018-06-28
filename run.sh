
#cat export_all.txt | grep amazon  | perl -pe 's{.*http}{http}g' | tee amazon_urls.txt
# grep -f product_url_strings_to_exclude.txt amazon_urls.txt | tee amazon_urls_products.txt
#echo "29196" | sh ~/bin/neo4j_amazon.sh | tee neo4j_amazon.txt | head -400 | sh asin2price.sh 

##
## Prices
##

cat export_all.txt | grep amazon  | perl -pe 's{.*http}{http}g' | tee amazon_urls.txt
grep -f product_url_strings_to_exclude.txt amazon_urls.txt | tee amazon_urls_products.txt
cat amazon_urls_products.txt | sh amazon_url2asin.sh | tee asins.txt
cat asins.txt| sh asin2price.sh 
echo "hi"

##
## Images
##

#cat ~/trash/out.json | perl -pe 's/\{http.*?2011-08-01\}//g' | tee ~/trash/out3.json | jq '.ItemLookupResponse.Items.Item.LargeImage.URL' | tee ~/trash/out4.json
echo "B01N1X82AU" | xargs groovy product2url.groovy | perl -pe 's/\{http.*?2011-08-01\}//g' | tee ~/trash/out3.json | jq '.ItemLookupResponse.Items.Item.LargeImage.URL' | tee ~/trash/out4.json