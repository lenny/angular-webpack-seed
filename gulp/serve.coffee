gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'
webpackConfig = require '../webpack.config.js'
path = require 'path'
buildenv = require './buildenv'

WebpackDevServer = require 'webpack-dev-server'

gulp.task 'serve', ['watch'], ->
  devConfig = Object.create(webpackConfig)
  devConfig.devtool = 'eval'
  devConfig.debug = true
  devConfig.output.path = path.resolve(buildenv.destDir())
  new WebpackDevServer webpack(devConfig),
    contentBase: buildenv.destDir()
    stats:
      colors: true

  .listen 8080, 'localhost', (err) ->
    throw new gutil.PluginError('webpack-dev-server', err) if err
    gutil.log '[webpack-dev-server]', 'http://localhost:8080/webpack-dev-server/index.html'
