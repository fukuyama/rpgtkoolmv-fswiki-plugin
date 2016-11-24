# functions.coffee

util = require '../mixin.coffee'

WINDOW_CONFIG  = ['ウィンドウ','暗くする','透明']
WINDOW_V_POS   = ['上','中','下']
WINDOW_H_POS   = ['左','中','右']
SELECT_LIST    = ['選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
SELECT_DEFAULT = ['なし'].concat SELECT_LIST
CANCEL_TYPE    = ['分岐','禁止'].concat SELECT_LIST
ITEM_TYPE      = ['通常アイテム','大事なもの','隠しアイテムＡ','隠しアイテムＢ']

functions =
  parseDefault : (v,d) ->
    if v == '' then d else v
  parseFaceImage : (name,index) ->
    if name == ''
      'なし'
    else
      "#{name}[#{index}]"
  parseWindowConfig     : (v) -> WINDOW_CONFIG[v]
  parseWindowVertical   : (v) -> WINDOW_V_POS[v]
  parseWindowHorizontal : (v) -> WINDOW_H_POS[v]
  parseVariableId       : (v) -> util.variables(v) + '[' + util.pad(v,4) + ']'
  parseSwitchId         : (v) -> util.switches(v)  + '[' + util.pad(v,4) + ']'
  parseSelectDefault    : (v) -> SELECT_DEFAULT[v]
  parseCancelType       : (v) -> CANCEL_TYPE[v]
  parseItemType         : (v) -> ITEM_TYPE[v]
  parseBoolean          : (v,a,b) -> if v then a else b
  parseActor  : (v) -> v
  parseClass  : (v) -> v
  parseSkill  : (v) -> v
  parseWeapon : (v) -> util.weapons(v) + '[' + util.pad(v,4) + ']'
  parseArmor  : (v) -> util.armors(v)  + '[' + util.pad(v,4) + ']'
  parseItem   : (v) -> util.items(v)   + '[' + util.pad(v,4) + ']'
  parseState  : (v) -> v

module.exports = functions
