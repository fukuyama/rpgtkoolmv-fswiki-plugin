# event-list.coffee

@event_filter = (o) -> o

@clickList = (e) =>
  event_view.update
    event : e.item.event
