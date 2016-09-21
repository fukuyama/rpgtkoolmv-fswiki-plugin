# event-command.coffee

param101 = [
  {
    parse : (v) ->
      if v == ''
        'なし'
      else
        v
  }
  {
    data : [
      'ウィンドウ'
      '暗くする'
      '透明'
    ]
    parse : (n) -> @data[n]
  }
  {
    data : [
      '上'
      '中'
      '下'
    ]
    parse : (n) -> @data[n]
  }
]

@commands =
  code101: (p) ->
    r = ['文章']
    r.push param101[i].parse v for v,i in p when param101[i]?
    r.join ':'
  code401: (p) ->
    p[0]

@showCommand = (command) ->
  {
    code
    indent
    parameters
  } = command
  fnkey = "code#{code}"
  if @commands[fnkey]?
    @commands[fnkey].call @,　parameters
  else
    code

#@on 'update', (e) ->
#  console.log 'event-command',@opts,e
