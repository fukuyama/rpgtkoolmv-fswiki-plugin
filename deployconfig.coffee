fs = require 'fs'
gutil  = require 'gulp-util'

readFileSync = (filename) ->
  try
    if fs.statSync(filename).isFile()
      fs.readFileSync　filename
  catch err
    ''

try
  if fs.statSync('./mydeployconfig.coffee').isFile()
    module.exports = require './mydeployconfig.coffee'
catch err
  gutil.log err.message
  module.exports =
    files : './dest/release/**'
    scp :
      host       : 'localhost'
      port       : 2222
      username   : 'vagrant'
      privateKey : readFileSync　'../.ssh/id_rsa'
      dest       : '/tmp/test/'
