# event-view.coffee

@datamap = {}

@event = undefined

@breadcrumbs = ['list']

@on 'update', (e) ->
  console.log 'event-view',@opts,e
