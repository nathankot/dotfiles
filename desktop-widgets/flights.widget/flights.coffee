command: """
  bash ./flights.widget/flights.bash
""",

refreshFrequency: '4h',

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
    for item in results
      first = true
      flightsCount = item.flights.length
      for flight in item.flights
        firstCol = if first then "<td class='first' rowspan=#{flightsCount}>#{item.price}</td>" else ""
        flight.duration = flight.duration / 60
        flight.duration = "#{flight.duration}h"
        flight.startDate = (new Date(flight.depart)).toDateString()

        $("""
          <tr>
            #{firstCol}
            <td>#{flight.startDate}</td>
            <td>#{flight.leg}</td>
            <td>#{flight.carrier}</td>
            <td>#{flight.duration}</td>
          </tr>
        """)
        .appendTo($body)
        first = false
  catch error
    $('<tr><td class="error" colspan="6">Could not fetch prices</td></tr>')
      .appendTo($body)

style: """
  margin   = 16px
  fontSize = 16px
  color    = white

  top: margin
  left: margin
  color: color
  font-family: "M+ 1m"
  font-size: fontSize
  font-weight: 400

  table {
    border-collapse: collapse;
    text-align: right
  }

  td {
    vertical-align: top;
    padding: 0.375em 2em
    margin: 0;
    border-left: 1px solid rgba(255, 255, 255, 0.1)
  }

  td.first {
    border-left: 0;
  }

  td.first {
    color: rgba(255, 255, 255, 0.7)
    text-align: left;
    padding-left: 0;
  }

  td.error {
    text-align center
  }

  .timeframe {
    font-size: 12px;
  }
"""
