# functions.coffee

WINDOW_CONFIG  = ['ウィンドウ','暗くする','透明']
WINDOW_V_POS   = ['上','中','下']
WINDOW_H_POS   = ['左','中','右']
SELECT_LIST    = ['選択肢#1','選択肢#2','選択肢#3','選択肢#4','選択肢#5','選択肢#6']
SELECT_DEFAULT = ['なし'].concat SELECT_LIST
CANCEL_TYPE    = ['分岐','禁止'].concat SELECT_LIST
ITEM_TYPE      = ['通常アイテム','大事なもの','隠しアイテムＡ','隠しアイテムＢ']

functions =
  parseDefault : (v,d) -> if v == '' then d else v
  parseWindowConfig : (v) -> WINDOW_CONFIG[v]
  parseWindowVertical : (v) -> WINDOW_V_POS[v]
  # parseListData : (d,b = 0) ->
  #   @data[n - b] ? n
  # data : d
  # base : b

module.exports = functions
