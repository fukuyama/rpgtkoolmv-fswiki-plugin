fs = require 'fs'

readFileSync = (filename) ->
  try
    if fs.statSync(filename).isFile()
      fs.readFileSync　filename
  catch err
    ''

module.exports =
  files : './dest/release/**'
  scp :
    host       : 'localhost'
    port       : 2222
    username   : 'vagrant'
    privateKey : readFileSync　'C:/project/tkool/.vagrant/machines/default/virtualbox/private_key'
    dest       : '/var/fswiki/test/'
