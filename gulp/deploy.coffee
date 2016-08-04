config  = require '../buildconfig.coffee'

gulp    = require 'gulp'
gscp    = require 'gulp-scp2'
replace = require 'gulp-replace'

deploy_task = (config_filename) ->
  ->
    {
      files
      scp
    } = require config_filename
    gulp.src files
      .pipe replace /\r?\n/g,'\n'
      .pipe gscp scp
      .on 'error', (err) ->
        console.log err

gulp.task 'deploy:prod', ['release'], deploy_task '../production.deploy.config.coffee'
gulp.task 'deploy:vm',   ['release'], deploy_task '../deployconfig.coffee'
