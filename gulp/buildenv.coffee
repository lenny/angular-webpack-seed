gulp = require 'gulp'
paths = gulp.paths

class BuildEnv
  destDir: ->
    if @production() then paths.dist else "#{paths.tmp}/server"
  
  production: ->
    for arg in process.argv
      return true if arg == '--production'
    false

module.exports = new BuildEnv
    