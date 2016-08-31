# move-speed.coffee

@names = [
  '-'
  '1/8倍速'
  '1/4倍速'
  '1/2倍速'
  '標準速'
  '2倍速'
  '4倍速'
]

@moveSpeed = (speed) -> @names[speed]

#@on 'update', (e) ->
#  console.log 'move-speed',@opts,e
