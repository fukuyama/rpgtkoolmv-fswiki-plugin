# event-detail.coffee

@event = {}

@on 'mount', (e) ->
  console.log e

@on 'update', (e) ->
  console.log e

@click = (e) ->
  console.log 'click'
