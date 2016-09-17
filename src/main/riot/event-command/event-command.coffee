# event-command.coffee

@commands =
  code101: (parameters) ->
    '文章表示'
  code401: (parameters) ->
    parameters[0]

@showCommand = (command) ->
  {
    code
    indent
    parameters
  } = command
  fnkey = "code#{code}"
  if @commands[fnkey]?
    @commands[fnkey].call @,　parameters
  else
    code

#@on 'update', (e) ->
#  console.log 'event-command',@opts,e
