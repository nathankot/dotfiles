command: """
  curl -s 'http://finance.yahoo.com/webservice/v1/symbols/NZDUSD=X,BTCUSD=X,USDJPY=X,NZDJPY=X/quote?format=json' | \
  ./bin/jq '[.list.resources[].resource.fields | { name: .symbol, price: .price, type: .type }]'
""",

refreshFrequency: '1h',

render: () -> """
  <table>
    <thead>
    </thead>
    <tbody>
    </tbody>
  </table>
"""

update: (o, el) ->
  try
    results = JSON.parse(o)
    $el = $(el)
    $body = $el.find('tbody')
    $body.empty()
    for item in results
      if item.type == 'currency'
        item.name = item.name.replace(/([A-Z]{3})([A-Z]{3}).*/, '$1 $2')
      $("""
        <tr>
          <td>#{item.price}</td>
          <td>#{item.name}</td>
        </tr>
      """).appendTo($body)
  catch error
    $('<tr><td class="error" colspan="6">Could not fetch prices</td></tr>')
      .appendTo($body)

style: """
  margin   = 16px
  fontSize = 16px
  color    = white

  top: margin
  right: margin
  color: color
  font-family: "M+ 1m"
  font-size: fontSize
  font-weight: 400

  table {
    border-collapse: collapse;
    text-align: right
  }

  td {
    padding: 0.375em 2em
    min-width: 120px;
    margin: 0;
  }

  td:last-of-type {
    border-left: 1px solid rgba(255, 255, 255, 0.1)
    color: rgba(255, 255, 255, 0.7)
    text-align: left
    min-width: 0
    padding-right: 0;
  }

  td.error {
    text-align center
  }
"""
