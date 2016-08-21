# item-name.coffee

@mixin require '../mixin.coffee'

@items = []

@name = (id) -> @items[id] ? '(アイテム)'

@on 'update', (e) ->
  if e?.items?
    @items = e.items
