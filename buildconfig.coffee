
config =
  riot :
    entry      : './src/main/riot/main.js'
    watchFiles : './src/main/riot/**'
    destDir    : './dest/public/js/'
    outputFile : 'event_view.js'

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

  clean :
    dir : './dest/'

module.exports = config
