config = require '../buildconfig.coffee'
gulp   = require 'gulp'

webserver = require 'gulp-webserver'

gulp.task 'webserver', ['webserver:build'], =>
  {
    destDir
    publicPath
  } = config
  gulp.src destDir + publicPath
    .pipe(
      webserver {
        host       : 'localhost'
        livereload : true
        open       : true
      }
    )

gulp.task 'webserver:build', =>
  {
    files
  } = config.webserver
  {
    destDir
    publicPath
  } = config
  gulp.src files
    .pipe gulp.dest destDir + publicPath

gulp.task 'webserver:watch', =>
  {
    files
  } = config.webserver
  gulp.watch files, [
    'webserver:build'
  ]
