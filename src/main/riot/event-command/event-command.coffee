# event-command.coffee

@commands =
  code101: (p) ->
    r = '文章:'
    r += p[0]
    if p[0] == ''
      r += 'なし'
    r += [':ウィンドウ',':暗くする',':透明'][p[1]]
    r += [':上',':中',':下'][p[2]]
    r
  code401: (p) ->
    p[0]

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
