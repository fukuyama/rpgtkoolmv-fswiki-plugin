# mixin.coffee

system =
  switches  : []
  variables : []
  items     : []
  weapons   : []
  armors    : []
  actors    : []

mixin =
  pad: (n, len) ->
    s = n.toString()
    while s.length < len
      s = '0' + s
    s

  updateSystem : (p) ->
    system.switches  = p.switches
    system.variables = p.variables

  updateItems   : (items)   -> system.items   = items
  updateWeapons : (weapons) -> system.weapons = weapons
  updateArmors  : (armors)  -> system.armors  = armors
  updateActors  : (actors)  -> system.actors  = actors

  switches  : (id) -> system.switches[id]  ? '(スイッチ)'
  variables : (id) -> system.variables[id] ? '(変数)'
  items     : (id) -> system.items[id].name ? '(アイテム)'
  weapons   : (id) -> system.weapons[id].name ? '(武器)'
  armors    : (id) -> system.armors[id].name ? '(防具)'
  actors    : (id) -> system.actors[id]

module.exports = mixin
