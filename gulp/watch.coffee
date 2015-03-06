'use strict';

gulp = require 'gulp'
path = require 'path'
paths = gulp.paths

gulp.task 'watch', ['build'], ->
  gulp.watch [
    path.join(paths.src, '**/*.*')
  ], [ 'build' ]