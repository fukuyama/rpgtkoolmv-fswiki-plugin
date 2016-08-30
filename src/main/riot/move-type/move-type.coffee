# move-type.coffee

@names = [
  '固定'
  'ランダム'
  '近づく'
  'カスタム'
]

@moveType = (type) -> @names[type]

#@on 'update', (e) ->
#  console.log 'move-type',@opts,e
