# vm_stat returns pages (4096 bytes on mac). 256 pages per MB.
# To convert pages to GB: no. of pages / 256 / 1024

command: "vm_stat | awk 'NR==2 {print \"Free,\"($3 / 256) / 1024} NR==3 {print \"Active,\"($3 / 256) / 1024} NR==4 {print \"Inactive,\"($3 / 256) / 1024} NR==7 {print \"Wired,\"($4 / 256) / 1024}'"

refreshFrequency: 6000

style: """
  bottom: 12px
  left: 312px
  color: #fff
  font-family: "M+ 1m"

  table
    border-collapse: collapse
    table-layout: fixed

  td
    font-size: 16px
    font-weight: normal
    width: 70px
    max-width: 70px
    overflow: hidden
    text-shadow: 0 0 1px rgba(#000, 0.5)

  .wrapper
    padding: 4px 6px 4px 6px
    position: relative


  p
    padding: 0
    margin: 0
    font-size: 13px
    font-weight: normal
    max-width: 100%
    color: #ddd
    text-overflow: ellipsis

  .pid
    position: absolute
    top: 2px
    right: 2px
    font-size: 10px
    font-weight: normal

"""


render: ->
  """
  <table>
    <tr>
      <td class='col1'></td>
      <td class='col2'></td>
      <td class='col3'></td>
      <td class='col4'></td>
    </tr>
  </table>
"""

update: (output, domEl) ->
  processes = output.split('\n')
  table     = $(domEl).find('table')

  renderProcess = (type, mem) ->
    "<div class='wrapper'>" +
      "#{Math.round(mem * 100) / 100}<p>#{type}</p>" +
    "</div>"

  for process, i in processes
    args = process.split(',')
    table.find(".col#{i+1}").html renderProcess(args...)
