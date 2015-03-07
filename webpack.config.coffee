'use strict'

path = require 'path'
gulp = require 'gulp'
webpack = require 'webpack'

module.exports =

  cache: true

  entry:
    app: './src/app/app.js'
    
  output:
    filename: 'scripts/[name].js'
    chunkFilename: 'scripts/[chunkhash].js'

  module:
    loaders: [
      {
        test: /\.coffee$/
        loader: 'coffee-loader'
      }
      {
        test: /\.scss$/
        loader: "style!css!sass?outputStyle=expanded&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components")) + "&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./bower_components/foundation/scss/")) + "&" +
          "includePaths[]=" +
            (path.resolve(__dirname, "./node_modules"))
      }
      {
        # required to write 'require('./style.css')'
        test: /\.css$/
        loader: 'style-loader!css-loader'
      }
    ]

  resolve:
    root: path.join(__dirname, 'src', 'app')

    # alias:
    #      # replace backbones underscore dependency with lodash
    #      'underscore': path.join(__dirname, 'node_modules', 'lodash', 'dist', 'lodash.compat.js')
    # 
     
    extensions: [
      ''
      '.coffee'
      '.css'
      '.js'
      '.scss'
      '.json'
    ]

    modulesDirectories: [
      'src/app'
      '.tmp/templates'
      'bower_components'
      'node_modules'
    ]

   plugins: [
    # new webpack.ProvidePlugin("angular": "angular")
   ]
  #   # extract common chunks from the 'app' and 'admin' entries into 'common.js'
  #   new commonsPlugin('javascripts/common.js', ['app', 'admin'])
  # ]