TIME_FRAME='1m'
START_DATE=$(date -v-${TIME_FRAME} +'%Y %m %d')
SYMBOLS='NZD:JPY:MYR:BTC'

read Y M D <<< ${START_DATE}

RESULT='[]'

for SYM in `echo $SYMBOLS | tr ':' "\n"`; do
  RESULT=$(echo $RESULT | ./bin/jq --arg n $SYM --arg t $TIME_FRAME '. + [{ symbol: $n, history: "", timeframe: $t }]')
  if [ "$SYM" != "BTC" ]
    then
      history=$(curl --fail -s "http://ichart.finance.yahoo.com/table.csv?s=${SYM}%3DX&g=d&ignore=.csv&c=${Y}&a=$(($M - 1))&b=${D}" \
            | tail -n +2 \
            | awk -F, '{ print $4 * 100 }' \
            | ./bin/spark)
      RESULT=$(echo $RESULT | ./bin/jq --arg n $SYM --arg h $history '(.[] | select(.symbol==$n) | .history) = $h')
    fi

  price=$(curl --fail -s http://finance.yahoo.com/webservice/v1/symbols/${SYM}USD%3DX/quote?format=json \
            | ./bin/jq -c '.list.resources[0].resource.fields.price | tonumber')
  RESULT=$(echo $RESULT | ./bin/jq --arg p $price --arg n $SYM '(.[] | select(.symbol==$n) | .price) = $p')
done

echo $RESULT