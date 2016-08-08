# event-view.coffee

@datamap = {}

@event = undefined

@on 'mount', ->
  global.event_view = @

@clickList = (e) ->
  @event = undefined
