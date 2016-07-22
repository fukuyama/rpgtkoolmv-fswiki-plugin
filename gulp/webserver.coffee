config = require '../buildconfig.coffee'
gulp   = require 'gulp'

webserver = require 'gulp-webserver'

gulp.task 'webserver', ['webserver:build'], =>
  {
    destDir
  } = config.webserver
  gulp.src destDir
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
    destDir
  } = config.webserver
  gulp.src files
    .pipe gulp.dest destDir

gulp.task 'webserver:watch', =>
  {
    files
  } = config.webserver
  gulp.watch files, [
    'webserver:build'
  ]
