gulp      = require 'gulp'
template  = require 'gulp-template'
rename    = require 'gulp-rename'
fs        = require 'fs'

gulp.task 'mktag', (cb) =>
  i = process.argv.indexOf '-name'
  if i < 0
    cb new Error('-name tag_name not found')
    return
  name = process.argv[i + 1]
  unless name
    cb new Error('-name tag_name not found')
    return
  base = 'src/main/riot/'
  i = process.argv.indexOf '-base'
  if i >= 0
    if process.argv[i + 1]
      base = process.argv[i + 1] + '/'
  fs.stat base + name, (err,stat) ->
    unless err?
      cb new Error("#{base + name} exists")
    else
      gulp.src('src/template/*')
        .pipe template
          name : name
        .pipe rename (path) ->
          path.basename = name
          path.extname  = '.tag.jade' if path.extname is '.jade'
        .pipe gulp.dest(base + name)
        .on 'end', cb
  return
