config     = require '../buildconfig.coffee'
gulp       = require 'gulp'
gutil      = require 'gulp-util'
uglify     = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'

browserify = require 'browserify'
babelify   = require 'babelify'
source     = require 'vinyl-source-stream'
buffer     = require 'vinyl-buffer'

gulp.task 'browserify', =>
  {
    files
    destDir
    outputFile
  } = config.jsx
  browserify files, { debug : true }
    .transform babelify, { presets : ['es2015','react'] }
    .bundle()
    .on 'error', (e) ->
      gutil.log(e.message)
      @emit('end')
    .pipe source(outputFile)
    .pipe buffer()
    .pipe sourcemaps.init { loadMaps : true }
    .pipe uglify()
    .on 'error', (e) ->
      gutil.log(e.message)
      @emit('end')
    .pipe sourcemaps.write('.')
    .pipe gulp.dest(destDir)

gulp.task 'browserify:watch', =>
  {
    watchFiles
  } = config.jsx
  gulp.watch watchFiles, ['browserify']
