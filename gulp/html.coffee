gulp = require 'gulp'
buildenv = require './buildenv'
templateCache = require 'gulp-angular-templatecache'

paths = gulp.paths

gulp.task 'templates', ->
  gulp.src("#{paths.src}/app/*/**/*.html")
    .pipe(templateCache(moduleSystem: 'Browserify'))
    .pipe(gulp.dest(buildenv.destDir()))

gulp.task 'html', ['templates'], ->
  gulp.src "#{paths.src}/app/*.html"
    .pipe gulp.dest(buildenv.destDir())

