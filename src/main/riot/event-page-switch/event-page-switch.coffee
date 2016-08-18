# event-page-switch.coffee

@mixin require '../mixin.coffee'

@on 'update', (e) ->
  console.log 'event-page-switch',@opts,e
