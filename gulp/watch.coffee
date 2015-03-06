'use strict';

gulp = require 'gulp'
path = require 'path'
webpack = require 'gulp-webpack-build'
webpackConfig = require '../webpack.config.js'
webpackOptions = {}

paths = gulp.paths

CONFIG_FILENAME = webpack.config.CONFIG_FILENAME

#gulp.task 'watch', ['html'], ->
#  gulp.watch [
#    path.join(paths.src, '**/*.html')
#  ], [ 'html' ]
#
appdir = "#{paths.src}/app"

gulp.task 'watch', ->
  gulp.watch(path.join(appdir, '**/*.*')).on 'change', (event)->
    echo JSON.stringify(event)
    if event.type == 'changed'
     gulp.src(event.path, base: path.resolve(appdir))
      .pipe(webpack.closest(CONFIG_FILENAME))
      .pipe(webpack.configure(webpackConfig))
      .pipe(webpack.overrides(webpackOptions))
      .pipe webpack.check (err, stats)->
         echo JSON.stringify("path: #{this.path} base: #{this.base}")
         gulp.src(this.path, base: this.base)
          .pipe(webpack.proxy(err, stats))
          .pipe(webpack.format(verbose: true, version: false))
          .pipe(gulp.dest("#{paths.tmp}/server"))
