config = require './buildconfig.coffee'
gulp   = require 'gulp'
gutil  = require 'gulp-util'

require('require-dir') './gulp'

gulp.task 'build', [
  'apply-production-environment'
  'browserify'
  'webserver:build'
]

gulp.task 'test', [
]

gulp.task 'watch', [
  'browserify:watch'
  'webserver:watch'
]

gulp.task 'default', [
  'test'
  'build'
  'watch'
  'webserver'
]

gulp.task 'apply-production-environment', =>
  gutil.log "Setting NODE_ENV to 'production'"
  process.env.NODE_ENV = 'production'
  if process.env.NODE_ENV != 'production'
    throw new Error "Failed to set NODE_ENV to production!!!!"
  else
    gutil.log "Successfully set NODE_ENV to production"
