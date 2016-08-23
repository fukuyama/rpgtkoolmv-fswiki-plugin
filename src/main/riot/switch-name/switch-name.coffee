# switch-name.coffee

@mixin require '../mixin.coffee'

@switches = []

@name = (id) -> @switches[id] ? '(スイッチ)'

@on 'update', (e) ->
  if e?.datasystem?
    @switches = e.datasystem.switches
