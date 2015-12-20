#!/bin/bash

ARGUMENTS=$@
ITEMS=${ARGUMENTS:-"77651,77648,77576,67386,73430,67375,67049,67048,70732,74092,77353,29174"}

curl -sS "http://www.gw2spidy.com/api/v0.9/json/items/all/1?filter_ids=$ITEMS" \
  | ./bin/jq '[.results[] | { name: .name,
                              buy: (.max_offer_unit_price / 10000),
                              sell: (.min_sale_unit_price / 10000),
                              demand: .offer_availability,
                              supply: .sale_availability,
                              change: .offer_price_change_last_hour }]'
