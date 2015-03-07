'use strict';

var angular = require('angular');

require('view1/view1');
require('view2/view2');
require('components/version/version');

angular.module('myApp',[
    require('angular-route')
])
.config(['$routeProvider', function($routeProvider) {
    $routeProvider.otherwise({redirectTo: '/view1'});
}]);

