# event-commands.coffee

riot = require 'riot'

#@on 'update', (e) ->
#  console.log 'event-commands',@opts,e

@on 'updated', (e) ->
  if @opts.page?.list?
    for command in @opts.page.list
      riot.mount "code#{ command.code }"
