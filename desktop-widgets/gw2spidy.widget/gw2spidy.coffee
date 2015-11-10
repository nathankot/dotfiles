command: "gw2spidy.widget/gw2spidyprices.bash",
refreshFrequency: 300000,
render: () -> """
  <table>
    <thead>
      <tr>
        <th></th>
        <th>price</th>
        <th>demand</th>
        <th>supply</th>
        <th>Δ last hour</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
"""
update: (o, el) ->
  results = JSON.parse(o)
  $el = $(el)
  $body = $el.find('tbody')
  $body.empty()
  for item in results
    $("""
      <tr>
        <td>#{item.name}</td>
        <td>#{Math.round(item.price)}</td>
        <td>#{item.demand}</td>
        <td>#{item.supply}</td>
        <td>#{item.change}</td>
      </tr>
     """).appendTo($body)
style: """
  margin = 24px
  top margin
  right margin
  color: white;
  font-family: "SF UI Display"
  font-size: 16px

  th, td {
    font-weight: 100
    padding: 4px
  }

  th {
    font-size 12px
  }

  td {
    text-align center
  }

  td:first-of-type {
    text-align left
    padding-right 36px
  }
"""
