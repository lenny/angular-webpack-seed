gulp = require 'gulp'
connect = require 'gulp-connect'
path = require 'path'
buildEnv = require './buildenv'

gulp.task 'serve', ['watch'], ->
  pattern = "#{buildEnv.destDir()}/**/*"
  gulp.watch pattern, (event)->
    gulp.src(event.path).pipe(connect.reload())

  connect.server
    root: buildEnv.destDir()
    livereload: true
    middleware: ->
      [

      ]
