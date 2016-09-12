# event-trigger.coffee

@names = [
  '決定ボタン'
  'プレイヤーから接触'
  'イベントから接触'
  '自動実行'
  '並列処理'
]

@triggerName = (trigger) -> @names[trigger]

#@on 'update', (e) ->
#  console.log 'event-trigger',@opts,e
