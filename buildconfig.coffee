
destDir = 'dest/'

config = {
  jsx :
    files      : './src/main/jsx/app.jsx'
    watchFiles : './src/main/jsx/**/*.jsx'
    destDir    : destDir + 'public/js/'
    outputFile : 'eventRender.js'

  webserver :
    files     : './src/main/public/**/*'
    publicDir : destDir + 'public'

  cleanDir : destDir
}

module.exports = config
