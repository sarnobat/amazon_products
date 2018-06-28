URL="${1:-https://www.amazon.com/Big-Fat-Body-Sally-Howell/dp/B01LWUISJI}"

IMAGE=$(echo $URL | sh amazon_url2asin.sh | xargs sh asin2json.sh | sh json2img.sh)
echo $URL::$IMAGE