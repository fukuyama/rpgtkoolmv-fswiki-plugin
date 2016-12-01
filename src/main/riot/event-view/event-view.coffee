# event-view.coffee

@mixin require '../mixin.coffee'

@datamap = {
  events : []
}

@event = undefined

@breadcrumbs = ['list']

@on 'update', (e) ->
  console.log 'event-view',@opts,e
  if e?
    if e.datasystem?
      @updateSystem e.datasystem
    if e.dataitems?
      @updateItems e.dataitems
    if e.dataactors?
      @updateActors e.dataactors
