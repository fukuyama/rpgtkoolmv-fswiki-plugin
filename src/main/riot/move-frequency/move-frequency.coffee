# move-frequency.coffee

@names = [
  '-'
  '最低'
  '低'
  '標準'
  '高'
  '最高'
]


@moveFrequency = (frequency) -> @names[frequency]

#@on 'update', (e) ->
#  console.log 'move-frequency',@opts,e
