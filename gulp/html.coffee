gulp = require 'gulp'
buildenv = require './buildenv'
paths = gulp.paths

gulp.task 'html', [], ->
  gulp.src "#{paths.src}/app/*.html"
    .pipe gulp.dest(buildenv.destDir())

