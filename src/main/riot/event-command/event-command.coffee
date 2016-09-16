# event-command.coffee

@commands =
  code101: -> '文章表示'

@showCommand = (command) ->
  {
    code
  } = command
  fnkey = "code#{code}"
  if @commands[fnkey]?
    @commands[fnkey].call @
  else
    code

#@on 'update', (e) ->
#  console.log 'event-command',@opts,e
