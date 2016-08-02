fs    = require 'fs'
gutil = require 'gulp-util'

readFileSync = (filename) ->
  try
    if fs.statSync(filename).isFile()
      fs.readFileSync　filename
  catch err
    ''

deploy =
  files : './dest/release/**'
  scp :
    host       : 'localhost'
    port       : 2222
    username   : 'vagrant'
    privateKey : readFileSync　'../.ssh/id_rsa'
    dest       : '/tmp/test/'

try
  for name in fs.readdirSync '.' when name.match /.+deploy.config.coffee/
    deploy = require './' + name
    gutil.log "Using deploy.config ./#{name}"
catch err
  gutil.log err.message

module.exports = deploy
