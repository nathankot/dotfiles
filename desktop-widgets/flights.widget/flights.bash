source ./keys.sh

curl --fail -s \
     -H "Content-Type: application/json" \
     --data-binary "@$1" \
     "https://www.googleapis.com/qpxExpress/v1/trips/search?key=$GOOGLE_QPX_API_KEY" | \
  ./bin/jq -cM '[.trips.tripOption[] |
      { price: .saleTotal,
        flights: [.slice[].segment[] |
        { duration: .duration,
          carrier: [.flight.carrier, .flight.number] | add,
          leg: [first(.leg[]).origin, " -> ", last(.leg[]).destination] | add,
          duration: [.leg[].duration] | add,
          depart: first(.leg[]).departureTime,
          arrive: last(.leg[]).arrivalTime }] }]'
