# event-list.coffee

@event_filter = (o) -> o

@click = (e) ->
  event_view.update
    event : e.item.event
