config = require '../buildconfig.coffee'
gulp   = require 'gulp'

gulp.task 'release', () =>
  {
    files
    options
    destDir
  } = config.release
  gulp.src files, options
    .pipe gulp.dest destDir
