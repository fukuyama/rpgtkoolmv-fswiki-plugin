# actor-name.coffee

@actors = []

@name = (id) -> @actors[id].name ? '(名前なし)'

@on 'update', (e) ->
  if e?.dataactors?
    @actors = e.dataactors
