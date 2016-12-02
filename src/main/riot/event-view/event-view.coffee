# event-view.coffee

@mixin require '../mixin.coffee'

@datamap = {
  events : []
}

@event = undefined

@breadcrumbs = ['list']

@on 'mount', (e) ->
  console.log 'mount event-view',@opts,e
  if @opts?
    if @opts.event?
      @event = @opts.event
    if @opts.datamap?
      @datamap = @opts.datamap
    if @opts.datasystem?
      @updateSystem @opts.datasystem
    if @opts.dataitems?
      @updateItems @opts.dataitems
    if @opts.dataactors?
      @updateActors @opts.dataactors
  @update()

#@on 'update', (e) ->
#  console.log 'update event-view',@opts,e
