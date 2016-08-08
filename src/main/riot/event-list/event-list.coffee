# event-list.coffee

@events = []

@on 'update', (e) ->
  if e?.datamap?.events?
    console.log 'udate list'
    @events = e.datamap.events.filter (o) -> o

@click = (e) ->
  event_view.update
    event : e.item.event
