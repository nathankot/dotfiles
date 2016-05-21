command: """
  bash ./fx.widget/fx.bash 2>&1
""",

refreshFrequency: '1h',

render: () -> """
  <table>
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
      item.timeframe = '' if item.history == ''
      $("""
        <tr>
          <td><span class="timeframe">#{item.timeframe}</span> #{item.history}</td>
          <td>#{item.price}</td>
          <td>#{item.symbol}</td>
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
    margin: 0;
    border-left: 1px solid rgba(255, 255, 255, 0.1)
  }

  td:first-of-type {
    border-left: 0;
  }

  td:last-of-type {
    color: rgba(255, 255, 255, 0.7)
    text-align: left
    padding-right: 0;
  }

  td.error {
    text-align center
  }

  .timeframe {
    font-size: 12px;
  }
"""
