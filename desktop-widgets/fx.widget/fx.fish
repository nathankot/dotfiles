set SYMBOLS 'NZD,JPY,BTC'
curl --fail -s "http://apilayer.net/api/live?access_key=$CURRENCY_LAYER_API_KEY&currencies=$SYMBOLS&source=USD&format=1" | jq .quotes
