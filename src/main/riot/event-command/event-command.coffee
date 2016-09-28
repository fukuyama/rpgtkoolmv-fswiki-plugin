# event-command.coffee

WINDOW_CONFIG  = ['ウィンドウ','暗くする','透明']
WINDOW_V_POS   = ['上','中','下']
WINDOW_H_POS   = ['左','中','右']
SELECT_LIST    = ['選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
SELECT_DEFAULT = ['なし'].concat SELECT_LIST
CANCEL_TYPE    = ['分岐','禁止'].concat SELECT_LIST

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

parseListData = (d,b = 0) ->
  parse : (n) ->
    @data[n - b] ? n
  data : d
  base : b

@commands =
  code101 :
    parse : (p) ->
      r = ['文章']
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
      parseDefault  'なし'
      parseListData WINDOW_CONFIG
      parseListData WINDOW_V_POS
      parseNop
    ]
  code102 :
    parse : (p) ->
      r = ['条件分岐']
      r.push @parameters[i].parse v for v,i in p when @parameters[i]?
      r.join ':'
    parameters : [
      undefined
      parseListData CANCEL_TYPE,-2
      parseListData SELECT_DEFAULT,-1
      parseListData WINDOW_H_POS
      parseListData WINDOW_CONFIG
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
