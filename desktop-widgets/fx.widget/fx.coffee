command: """
  /usr/local/bin/fish -c 'source ~/.shell/0.environment.fish; and fish ./fx.widget/fx.fish 2>&1'
""",

refreshFrequency: '2h',

render: () -> """
  <table>
    <tbody>
    </tbody>
  </table>
"""

update: (o, el) ->
  try
    console.log(o)
    results = JSON.parse(o)
    $el = $(el)
    $body = $el.find('tbody')
    $body.empty()

    results.NZDJPY = results.USDJPY / results.USDNZD

    for key, value of results
      $("""
        <tr>
          <td>#{key}</td>
          <td>#{value.toFixed(6)}</td>
        </tr>
      """).appendTo($body)
  catch error
    $('<tr><td class="error" colspan="2">Could not fetch prices</td></tr>')
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
    color: rgba(255, 255, 255, 0.7);
    text-align: right;
    padding-right: 0;
  }

  td.error {
    text-align center
  }
"""
