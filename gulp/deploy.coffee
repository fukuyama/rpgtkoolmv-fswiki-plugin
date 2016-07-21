config = require '../buildconfig.coffee'
gulp   = require 'gulp'
gscp   = require 'gulp-scp2'

gulp.task 'deploy', ['release'], (cb) =>
  {
    files
    scp
  } = config.deploy
  return gulp.src files
    .pipe gscp scp
    .on 'error', (err) ->
      console.log err
