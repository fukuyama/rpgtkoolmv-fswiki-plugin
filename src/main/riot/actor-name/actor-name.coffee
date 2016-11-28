# actor-name.coffee

@mixin require '../mixin.coffee'

@actorName = (id) ->
  console.log 'actorName'
  console.log @actors
  actor = @actors(id)
  console.log actor
  if actor? then actor.name else '(名前なし)'
