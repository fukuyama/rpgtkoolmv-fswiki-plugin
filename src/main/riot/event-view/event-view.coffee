# event-view.coffee

@datamap = {}

@event = undefined

@breadcrumbs = ['list']

@on 'mount', ->
  global.event_view = @

@on 'update', (e) ->
  if e?.datamap?
    @event = e.datamap.events[2]
    e.event = @event
    console.log @event
  @breadcrumbs = ['list']
  if e?.event?
    @breadcrumbs.push 'eventid'
