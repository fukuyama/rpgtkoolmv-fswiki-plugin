# mixin.coffee

mixin =
  pad: (n, len) ->
    s = n.toString()
    while s.length < len
      s = '0' + s
    s

module.exports = mixin
