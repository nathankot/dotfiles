format = '%d %a %l:%M %p'

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 30000

render: (output) -> """
  <h1>#{output}</h1>
"""

style: """
  color: #FFFFFF
  font-family: "M+ 1m"
  left: 16px
  bottom: 64px

  h1
    font-weight: 400
    font-size: 2em
    margin: 0
    padding: 0
  """
