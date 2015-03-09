gulp = require 'gulp'
templateCache = require 'gulp-angular-templatecache'
path = require 'path'
buildenv = require './buildenv'

paths = gulp.paths

gulp.task 'templates', ->
  gulp.src("#{paths.src}/app/*/**/*.html")
    .pipe templateCache(
    	moduleSystem: 'Browserify'
    	#standalone: true
    	module: 'myApp'
    )
    .pipe gulp.dest(path.join(paths.tmp, 'templates'))

