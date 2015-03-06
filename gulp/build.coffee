'use strict'

gulp = require 'gulp'

paths = gulp.paths;

gulp.task 'clean', ->
  rm '-rf', "#{paths.dist}/*", "#{paths.tmp}/*"
  
gulp.task 'build', ['html', 'webpack']
  