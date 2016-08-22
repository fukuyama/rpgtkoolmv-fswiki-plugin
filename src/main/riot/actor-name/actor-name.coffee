# actor-name.coffee

@actors = []

@name = (id) -> @actors[id] ? '(名前なし)'

@on 'update', (e) ->
  if e?.actors?
    @actors = e.actors
