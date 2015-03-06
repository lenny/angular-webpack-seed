'use strict'

gulp = require 'gulp'
path = require 'path'
webpack = require 'gulp-webpack-build'
buildenv = require './buildenv'
paths = gulp.paths

webpackOptions = 
  debug: true
  devtool: '#source-map'
  watchDelay: 200

webpackConfig =
  useMemoryFs: true
  progress: true

CONFIG_FILENAME = webpack.config.CONFIG_FILENAME

gulp.task 'scripts', [], ->
  gulp.src CONFIG_FILENAME, base: path.resolve(paths.src)
    .pipe webpack.configure(webpackConfig)
    .pipe webpack.overrides(webpackOptions)
    .pipe webpack.compile()
    .pipe webpack.format(version: false, timings: true)
    .pipe webpack.failAfter(errors: true, warnings: true)
    .pipe gulp.dest(buildenv.destDir())
