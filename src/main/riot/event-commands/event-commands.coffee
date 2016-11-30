# event-commands.coffee

riot = require 'riot'

#@on 'update', (e) ->
#  console.log 'event-commands',@opts,e

@on 'updated', (e) ->
  if @opts.page?.list?
    for command,i in @opts.page.list
      riot.mount ".s#{i}", "code#{ command.code }", {command: command}
      # console.log tag,command if tag.length is 0
