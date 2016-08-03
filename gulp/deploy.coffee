config  = require '../buildconfig.coffee'

gulp    = require 'gulp'
gscp    = require 'gulp-scp2'
replace = require 'gulp-replace'

gulp.task 'deploy', ['release'], ->
  {
    files
    scp
  } = config.deploy
  return gulp.src files
    .pipe replace /\r?\n/g,'\n'
    .pipe gscp scp
    .on 'error', (err) ->
      console.log err
