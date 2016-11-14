# code111.coffee

@mixin require '../functions.coffee'

@conditional = (command) ->
  p = command.parameters
  r = []
  t = p[0]
  switch t
    when 0 # スイッチ
      r.push 'スイッチ' + @parseSwitchId p[1]
    when 1 # 変数
      r.push '変数'
      v1 = @parseVariableId p[1]
      v2 = if p[2] is 0 then p[3] else @parseVariableId p[3]
      switch p[4]
        when 0  # Equal to
          r.push "#{v1} が #{v2} と等しい"
        when 1  # Greater than or Equal to
          r.push "#{v1} が #{v2} 以上"
        when 2  # Less than or Equal to
          r.push "#{v1} が #{v2} 以下"
        when 3  # Greater than
          r.push "#{v1} が #{v2} より大きい"
        when 4  # Less than
          r.push "#{v1} が #{v2} より小さい"
        when 5  # Not Equal to
          r.push "#{v1} が #{v2} と等しくない"
    when 2 # セルフスイッチ
      r.push 'セルフスイッチ' + p[1]
    when 3 # タイマー
      r.push 'タイマー'
    when 4 # アクター
      r.push 'アクター'
    when 5 # エネミー
      r.push 'エネミー'
    when 6 # キャラクター
      r.push 'キャラクター'
    when 7 # お金
      r.push 'お金'
      switch p[2]
        when 0 # Greater than or equal to
          r.push p[1] + '以上'
        when 1 # Less than or equal to
          r.push p[1] + '以下'
        when 2 # Less than
          r.push p[1] + '未満'
    when 8 # Item
      r.push 'アイテム'
    when 9 # Weapon
      r.push '武器'
    when 10 # Armor
      r.push '防具'
    when 11 # Button
      r.push 'ボタン'
    when 12 # Script
      r.push 'スクリプト'
    when 13 # Vehicle
      r.push '乗り物'
    else
      r.push t
      r.push p
  r.join ':'

#@on 'update', (e) ->
#  console.log 'code111',@opts,e
