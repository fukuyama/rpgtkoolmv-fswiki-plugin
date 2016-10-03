# mixin.coffee

system =
  switches : []
  variables : []

mixin =
  pad: (n, len) ->
    s = n.toString()
    while s.length < len
      s = '0' + s
    s

  updateSystem : (p) ->
    system.switches  = p.switches
    system.variables = p.variables

  switches : (id) -> system.switches[id] ? '(スイッチ)'

  variables : (id) -> system.variables[id] ? '(変数)'


module.exports = mixin
