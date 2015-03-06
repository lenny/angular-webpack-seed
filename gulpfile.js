'use strict';

var gulp = require('gulp');

require('coffee-script/register');
require('shelljs/global');

gulp.paths = {
  src: 'src',
  dist: 'dist',
  tmp: '.tmp',
  e2e: 'e2e'
};

require('require-dir')('./gulp');

gulp.task('default', ['clean'], function () {
	
	// echo('hello');
	//     gulp.start('build');
});
