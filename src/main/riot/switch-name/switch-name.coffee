# switch-name.coffee

@mixin require '../mixin.coffee'

@switches = []

@name = (id) -> @switches[id] ? '(スイッチ)'

@on 'update', (e) ->
  if e?.switches?
    @switches = e.switches
