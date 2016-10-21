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

parseDataOperand = (type, param1, param2) ->
  switch type
    when 0 # Item
      return @items param1
    when 1 # Weapon
      return @weapons param1
    when 2 # Armor
      return @armors param1
    when 3 # Actor
      return @actors param1
    else
      return type + ',' + param1 + ',' + param2
  return ''
  # switch (type) {
  # case 0:  // Item
  #     return $gameParty.numItems($dataItems[param1]);
  # case 1:  // Weapon
  #     return $gameParty.numItems($dataWeapons[param1]);
  # case 2:  // Armor
  #     return $gameParty.numItems($dataArmors[param1]);
  # case 3:  // Actor
  #     var actor = $gameActors.actor(param1);
  #     if (actor) {
  #         switch (param2) {
  #         case 0:  // Level
  #             return actor.level;
  #         case 1:  // EXP
  #             return actor.currentExp();
  #         case 2:  // HP
  #             return actor.hp;
  #         case 3:  // MP
  #             return actor.mp;
  #         default:    // Parameter
  #             if (param2 >= 4 && param2 <= 11) {
  #                 return actor.param(param2 - 4);
  #             }
  #         }
  #     }
  #     break;
  # case 4:  // Enemy
  #     var enemy = $gameTroop.members()[param1];
  #     if (enemy) {
  #         switch (param2) {
  #         case 0:  // HP
  #             return enemy.hp;
  #         case 1:  // MP
  #             return enemy.mp;
  #         default:    // Parameter
  #             if (param2 >= 2 && param2 <= 9) {
  #                 return enemy.param(param2 - 2);
  #             }
  #         }
  #     }
  #     break;
  # case 5:  // Character
  #     var character = this.character(param1);
  #     if (character) {
  #         switch (param2) {
  #         case 0:  // Map X
  #             return character.x;
  #         case 1:  // Map Y
  #             return character.y;
  #         case 2:  // Direction
  #             return character.direction();
  #         case 3:  // Screen X
  #             return character.screenX();
  #         case 4:  // Screen Y
  #             return character.screenY();
  #         }
  #     }
  #     break;
  # case 6:  // Party
  #     actor = $gameParty.members()[param1];
  #     return actor ? actor.actorId() : 0;
  # case 7:  // Other
  #     switch (param1) {
  #     case 0:  // Map ID
  #         return $gameMap.mapId();
  #     case 1:  // Party Members
  #         return $gameParty.size();
  #     case 2:  // Gold
  #         return $gameParty.gold();
  #     case 3:  // Steps
  #         return $gameParty.steps();
  #     case 4:  // Play Time
  #         return $gameSystem.playtime();
  #     case 5:  // Timer
  #         return $gameTimer.seconds();
  #     case 6:  // Save Count
  #         return $gameSystem.saveCount();
  #     case 7:  // Battle Count
  #         return $gameSystem.battleCount();
  #     case 8:  // Win Count
  #         return $gameSystem.winCount();
  #     case 9:  // Escape Count
  #         return $gameSystem.escapeCount();
  #     }
  #     break;
  # }
  # return 0;

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
      op = parseListData(['代入','加算','減算', '乗算','除算','乗余']).parse p[2]
      parseParameters r,p,@parameters
      switch p[3]
        when 0
          r.push "#{p[4]}を#{op}"
        when 1
          r.push parseVariableId.parse(p[4]) + "を" + op
        when 2
          r.push 'ランダム' + p[5] + '-' + p[4] + 1
        when 3
          r.push 'ゲームデータ ' + parseDataOperand(p[4], p[5], p[6])
      r.join ':'
    parameters : [
      parseVariableId
      parseVariableId
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
