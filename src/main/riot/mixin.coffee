# mixin.coffee

system =
  switches : []
  variables : []
  items : []

mixin =
  pad: (n, len) ->
    s = n.toString()
    while s.length < len
      s = '0' + s
    s

  updateSystem : (p) ->
    system.switches  = p.switches
    system.variables = p.variables

  updateItems : (items) ->
    system.items = items

  switches : (id) -> system.switches[id] ? '(スイッチ)'

  variables : (id) -> system.variables[id] ? '(変数)'

  items : (id) -> system.items[id].name ? '(アイテム)'


module.exports = mixin
