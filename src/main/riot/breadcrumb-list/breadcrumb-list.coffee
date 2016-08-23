# breadcrumb-list.coffee

@breadcrumbs = []

@event = undefined

@clickList = (e) =>
  event_view.update
    event : undefined

@on 'update', (e) ->
  @breadcrumbs = ['list']
  if e?.event?
    @breadcrumbs.push 'eventid'
    #console.log 'breadcrumb-list',@opts,e
