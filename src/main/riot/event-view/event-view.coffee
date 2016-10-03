# event-view.coffee

@mixin require '../mixin.coffee'

@datamap = {}

@event = undefined

@breadcrumbs = ['list']

@on 'update', (e) ->
  console.log 'event-view',@opts,e
  if e?.datasystem?
    @updateSystem e.datasystem
