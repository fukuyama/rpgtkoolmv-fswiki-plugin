# event-command.coffee

parseNop =
  parse : (v) -> v

parseParameters = (p,parameters) ->
  parameters[i].parse v for v,i in p when parameters[i]?

parseDefault = (d) ->
  parse : (v) ->
    if v == ''
      d
    else
      v

parseListData = (l) ->
  parse : (n) -> @data[n]
  data : l

@commands =
  code101 :
    parse : (p) ->
      r = ['文章']
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
      parseDefault  'なし'
      parseListData ['ウィンドウ','暗くする','透明']
      parseListData ['上','中','下']
      parseNop
    ]
  code102 :
    parse : (p) ->
      r = ['条件分岐']
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
      undefined
      parseListData ['分岐','禁止','選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
      parseListData ['なし','選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
      parseListData ['左','中','右']
      parseListData ['ウィンドウ','暗くする','透明']
      parseNop
    ]
  code401 :
    parseDefault ''
  code402 :
    parse : (p) ->
      r = []
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
      parseNop
      parseNop
      parseNop
      parseNop
    ]

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
