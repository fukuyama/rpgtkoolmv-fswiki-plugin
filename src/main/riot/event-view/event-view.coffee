# event-view.coffee

@datamap = {}

@event = undefined

@breadcrumbs = ['list']

@on 'mount', ->
  global.event_view = @

@on 'update', ->
  @breadcrumbs = ['list']
  if @event?
    @breadcrumbs.push 'eventid'
