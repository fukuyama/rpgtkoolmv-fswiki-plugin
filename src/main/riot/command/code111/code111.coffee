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
      r.push '変数' + @parseVariableId p[1]
    when 2 # セルフスイッチ
      r.push 'セルフスイッチ' + p[1]
    when 7 # Gold
      r.push 'お金'
      switch p[2]
        when 0 # Greater than or equal to
          r.push p[1] + '以上'
        when 1 # Less than or equal to
          r.push p[1] + '以下'
        when 2 # Less than
          r.push p[1] + '未満'
    else
      r.push t
      r.push p
  r.join ':'

#@on 'update', (e) ->
#  console.log 'code111',@opts,e
