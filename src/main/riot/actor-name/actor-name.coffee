# actor-name.coffee

@mixin require '../mixin.coffee'

@actorName = (id) ->
  actor = @actors(id)
  if actor? then actor.name else '(名前なし)'
