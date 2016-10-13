# event-command.coffee

@mixin require '../mixin.coffee'

util = @

WINDOW_CONFIG  = ['ウィンドウ','暗くする','透明']
WINDOW_V_POS   = ['上','中','下']
WINDOW_H_POS   = ['左','中','右']
SELECT_LIST    = ['選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
SELECT_DEFAULT = ['なし'].concat SELECT_LIST
CANCEL_TYPE    = ['分岐','禁止'].concat SELECT_LIST
ITEM_TYPE      = ['通常アイテム','大事なもの','隠しアイテムＡ','隠しアイテムＢ']

parseNop =
  parse : (v) -> v

parseValue = (param) ->
  {
    prefix
    suffix
  } = param
  parse  : (v) -> @prefix + v + @suffix
  prefix : prefix ? ''
  suffix : suffix ? ''

parseBoolean = (param) ->
  {
    prefix
    suffix
    text
    value
  } = param
  parse  : (v) ->
    if @value?
      v = (@value is v)
    if v
      @prefix + @text[0] + @suffix
    else
      @prefix + @text[1] + @suffix
  text   : text ? ['','']
  prefix : prefix ? ''
  suffix : suffix ? ''
  value  : value

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

parseVariableId =
  parse : (v) -> util.variables(v) + '[' + util.pad(v,4) + ']'

parseSwitchId =
  parse : (v) -> util.switches(v) + '[' + util.pad(v,4) + ']'

parseParameters = (r,p,parameters) ->
  r.push parameters[i].parse v for v,i in p when parameters[i]?

@commands =
  code101 :
    parse : (p) ->
      r = ['文章']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseDefault  'なし'
      parseDefault  ''
      parseListData WINDOW_CONFIG
      parseListData WINDOW_V_POS
    ]
  code102 :
    parse : (p) ->
      r = ['選択肢']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseNop
      parseListData CANCEL_TYPE,-2
      parseListData SELECT_DEFAULT,-1
      parseListData WINDOW_H_POS
      parseListData WINDOW_CONFIG
      parseNop
    ]
  code103 :
    parse : (p) ->
      r = ['数値の入力']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseVariableId
      parseValue
        prefix : '最大桁数'
    ]
  code104 :
    parse : (p) ->
      r = ['アイテムの選択']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseVariableId
      parseListData ITEM_TYPE,1
    ]
  code105 :
    parse : (p) ->
      r = ['文章スクロール']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseValue
        prefix : '速度'
      parseBoolean
        text   : ['なし','あり']
        prefix : '早送り'
    ]
  code111 :
    parse : (p) ->
      r = ['分岐']
      t = p.shift()
      switch t
        when 0 # スイッチ
          parseParameters r,p, @parameters0
        #when 1 # 変数
        #when 2 # セルフスイッチ
        else
          r.push t
          parseParameters r,p, @parameters
      r.join ':'
    parameters : [
      parseNop
      parseNop
      parseNop
    ]
    parameters0 : [
      parseSwitchId
    ]
  code121 :
    parse : (p) ->
      r = ['スイッチ操作']
      parseParameters r,p,@parameters
      r.join ':'
    parameters : [
      parseSwitchId
      parseSwitchId
      parseBoolean
        value : 0
        text  : ['ON','OFF']
    ]
  code122 :
    parse : (p) ->
      r = ['変数操作']
      parseParameters r,p,@parameters
      switch p[3]
        when 0
          r.push "#{p[4]}を代入"
        when 1
          r.push parseVariableId.parse(p[4]) + "を代入"
      r.join ':'
    parameters : [
      parseVariableId
      parseVariableId
      parseNop
    ]
  code401 :
    parseDefault ''
  code402 :
    parse : (p) -> "\"#{p[1]}\"を選択した場合"
  code403 :
    parse : (p) -> 'キャンセルした場合'
  code404 :
    parse : (p) -> '◆'
  code405 :
    parseDefault ''
  code0 :
    parse : (p) -> '◆'

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
