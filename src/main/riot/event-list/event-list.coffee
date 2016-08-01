# event-list.coffee

@events = []

@on 'update', ->
  if opts.events
    @events = opts.events.filter (o) -> o
