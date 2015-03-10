'use strict';

var angular = require('angular');

require('./interpolate-filter');
require('./version-directive');

angular.module('myApp.version', [
  'myApp.version.interpolate-filter',
  'myApp.version.version-directive'
])

.value('version', '0.1');