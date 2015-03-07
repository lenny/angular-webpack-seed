'use strict'

gulp = require 'gulp'
gutil = require('gulp-util')
webpack = require 'webpack'
buildenv = require './buildenv'

webpackConfig = require('../webpack.config')

devConfig = Object.create(webpackConfig)
devConfig.output.path = buildenv.destDir()
devConfig.devtool = '#source-map'
devConfig.debug = true

productionConfig = Object.create(webpackConfig)
productionConfig.output.path = buildenv.destDir()
productionConfig.plugins.concat(
  new webpack.DefinePlugin 'process.env': { NODE_ENV: JSON.stringify('production') }
  new webpack.optimize.DedupePlugin()
  new webpack.optimize.UglifyJsPlugin()
)

gulp.task 'webpack', [], (callback)->
  config = if buildenv.production() then devConfig else productionConfig

  webpack config, (err, stats) ->
    throw new gutil.PluginError('webpack', err) if err
    gutil.log '[webpack]', stats.toString colors: true
    callback()
