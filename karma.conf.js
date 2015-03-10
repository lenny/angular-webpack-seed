var path = require('path');
var webpackConfig = Object.create(require('./webpack.config'));
webpackConfig.entry = {};
webpackConfig.output = {};
webpackConfig.devtool = 'eval'

module.exports = function (config) {
  config.set({

    basePath: './',

    files: [
      'tests.webpack.js' //just load this file
    ],

    preprocessors: {
      'tests.webpack.js': [ 'webpack' ] //preprocess with webpack and our sourcemap loader
    },

    autoWatch: true,

    frameworks: ['jasmine'],

    browsers: ['Chrome'],

    junitReporter: {
      outputFile: 'test_out/unit.xml',
      suite: 'unit'
    },

    logLevel: config.LOG_DEBUG,

    webpack: webpackConfig

  });
};
