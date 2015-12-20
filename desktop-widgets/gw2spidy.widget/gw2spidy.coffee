command: "gw2spidy.widget/gw2spidyprices.bash",
refreshFrequency: 300000,

render: () -> """
  <div class="button">GW2</div>

  <table>
    <thead>
      <tr>
        <th></th>
        <th>buy</th>
        <th>sell</th>
        <th>demand</th>
        <th>supply</th>
        <th>Δ</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
"""

afterRender: (el) ->
  $el = $(el)
  $button = $el.find('.button')
  $button.on 'click', (e) -> $el.toggleClass 'show'

update: (o, el) ->
  try
    results = JSON.parse(o)
    $el = $(el)
    $body = $el.find('tbody')
    $body.empty()
    for item in results
      $("""
        <tr>
          <td>#{item.name}</td>
          <td>#{Math.round(item.buy * 100) / 100}</td>
          <td>#{Math.round(item.sell * 100) / 100}</td>
          <td>#{item.demand}</td>
          <td>#{item.supply}</td>
          <td>#{item.change}</td>
        </tr>
      """).appendTo($body)
  catch error
    $('<tr><td class="error" colspan="6">Could not fetch prices</td></tr>')
      .appendTo($body)

style: """
  margin = 12px
  fontSize = 14px
  color = white

  top: margin
  right: margin
  color: color
  font-family: "SF UI Text"
  font-size: fontSize

  transform: unquote("translateX(calc(100% + " + margin + "))")
  transition: transform 0.3s ease

  &.show {
    transform: translateX(0)
  }

  .button {
    position: absolute
    top: 0
    right: unquote("calc(100% + " + margin + ")")
    font-size: 0.75em
    width: 36px
    height: @width
    text-align: center
    line-height: @height
    border: 1px solid white
    border-radius: 50%
  }

  thead th {
    border-bottom: 1px solid rgba(255, 255, 255, 0.44)
  }

  th, td {
    font-weight: 100
    padding: 0.375em 1.125em
  }

  th {
    font-size: 0.75em
  }

  td {
    text-align center
  }

  td:first-of-type {
    text-align left
    padding-right 36px
  }

  td.error {
    text-align center
  }
"""
