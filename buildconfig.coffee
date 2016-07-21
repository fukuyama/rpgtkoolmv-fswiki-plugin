
destDir = 'dest/'

publicPath = 'public/'
jsPath     = 'js/'

config = {
  destDir    : destDir
  cleanDir   : destDir
  publicPath : publicPath
  jsPath     : jsPath

  jsx :
    files      : './src/main/jsx/app.jsx'
    watchFiles : './src/main/jsx/**/*.jsx'
    destDir    : destDir + publicPath + jsPath
    outputFile : 'eventRender.js'

  webserver :
    files     : './src/main/public/**'

  deploy :
    files : [
      destDir + 'release/**'
    ]
    scp :
      host       : 'localhost'
      port       : 2222
      username   : 'vagrant'
      privateKey : require('fs').readFileSync　'../.ssh/id_rsa'
      dest       : '/tmp/test/'

}

module.exports = config
