source ./keys.sh

RESULT='[]'

for f in ./flight-requests/*.json; do
  RESPONSE=$(curl \
    --fail -s \
    -H "Content-Type: application/json" \
    --data-binary "@$f" \
    "https://www.googleapis.com/qpxExpress/v1/trips/search?key=$GOOGLE_QPX_API_KEY" | \
    ./bin/jq \
      -cM '[.trips.tripOption[] | {
        price: .saleTotal,
        flights: [.slice[].segment[] | {
          duration: .duration,
          carrier: [.flight.carrier, .flight.number] | add,
          leg: [first(.leg[]).origin, " ✈  ", last(.leg[]).destination] | add,
          duration: [.leg[].duration] | add,
          depart: first(.leg[]).departureTime,
          arrive: last(.leg[]).arrivalTime }] }]')

  RESULT=$(echo $RESULT | ./bin/jq --argjson r "$RESPONSE" '. + $r' )
done

echo $RESULT
