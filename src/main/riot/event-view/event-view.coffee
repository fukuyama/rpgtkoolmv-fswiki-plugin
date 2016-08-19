# event-view.coffee

@datamap = {}

@event = undefined

@breadcrumbs = ['list']

@on 'mount', ->
  global.event_view = @

@on 'update', (e) ->
  console.log 'event-view',@opts,e
