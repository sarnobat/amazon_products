#cat export_all.txt | grep amazon  | perl -pe 's{.*http}{http}g' | tee amazon_urls.txt
# grep -v -f product_url_strings_to_exclude.txt amazon_urls.txt | tee amazon_urls_products.txt
#echo "29196" | sh ~/bin/neo4j_amazon.sh | tee neo4j_amazon.txt | head -400 | sh asin2price.sh 

cat export_all.txt | grep amazon  | perl -pe 's{.*http}{http}g' | tee amazon_urls.txt
grep -f product_url_strings_to_exclude.txt amazon_urls.txt | tee amazon_urls_products.txt
cat amazon_urls_products.txt | sh amazon_url2asin.sh | tee asins.txt
cat asins.txt | head -4 | sh asin2price.sh 