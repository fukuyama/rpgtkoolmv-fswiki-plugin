config = require '../buildconfig.coffee'
gulp   = require 'gulp'

gulp.task 'release', ['build'], () =>
  {
    destDir
    publicPath
    jsPath
  } = config
  gulp.src [
      destDir + publicPath + 'plugin/**'
      destDir + publicPath + jsPath + '**'
    ], { base: destDir + publicPath }
    .pipe gulp.dest destDir + 'release'
