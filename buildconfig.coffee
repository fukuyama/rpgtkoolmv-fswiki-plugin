
config =
  riot :
    entry      : './src/main/riot/main.js'
    watchFiles : './src/main/riot/**'
    destDir    : './dest/public/js/'
    outputFile : 'bundle.js'

  webserver :
    files     : './src/main/public/**'
    publicDir : './dest/public/'

  release :
    files : [
      './dest/public/plugin/**'
      './dest/public/js/**'
    ]
    options :
      base : './dest/public/'
    destDir : './dest/release/'

  deploy :
    files : './dest/release/**'
    scp :
      host       : 'localhost'
      port       : 2222
      username   : 'vagrant'
      privateKey : require('fs').readFileSync　'../.ssh/id_rsa'
      dest       : '/tmp/test/'

  clean :
    dir : './dest/'

module.exports = config
