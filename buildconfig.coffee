
path =
  dest    : 'dest/'
  public  : 'public/'
  js      : 'js/'
  release : 'release/'
  plugin  : 'plugin/'

config = {

  clean :
    dir : path.dest

  jsx :
    files      : './src/main/jsx/app.jsx'
    watchFiles : './src/main/jsx/**/*.jsx'
    destDir    : path.dest + path.public + path.js
    outputFile : 'eventRender.js'

  webserver :
    files   : './src/main/public/**'
    destDir : path.dest + path.public

  release :
    files : [
      path.dest + path.public + path.plugin + '**'
      path.dest + path.public + path.js     + '**'
    ]
    options :
      base : path.dest + path.public
    destDir : path.dest + path.release

  deploy :
    files : path.dest + path.release + '**'
    scp :
      host       : 'localhost'
      port       : 2222
      username   : 'vagrant'
      privateKey : require('fs').readFileSync　'../.ssh/id_rsa'
      dest       : '/tmp/test/'

}

module.exports = config
