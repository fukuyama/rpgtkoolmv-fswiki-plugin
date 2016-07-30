# event-list.coffee

@events = [
  {
    id   : 1
    name : 'test'
    x    : 10
    y    : 9
  }
]

@pad = (n, len) ->
  s = n.toString()
  while s.length < len
    s = '0' + s
  s
