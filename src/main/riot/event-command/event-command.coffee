# event-command.coffee


@commands =
  code101 :
    parse : (p) ->
      r = ['文章']
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
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
  code401 :
    parse : (p) -> p[0]

@showCommand = (command) ->
  {
    code
    indent
    parameters
  } = command
  fnkey = "code#{code}"
  if @commands[fnkey]?
    @commands[fnkey].parse　parameters
  else
    code

#@on 'update', (e) ->
#  console.log 'event-command',@opts,e
