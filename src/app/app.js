'use strict';

var angular = require('angular');

require('view1/view1');

// Declare app level module which depends on views, and components
//var myApp = [
//    require('angular-route'),
//    require('view1/view1'),
////  'myApp.view2',
////  'myApp.version'
//];

angular.module('myApp',[
    require('angular-route')
])
.config(['$routeProvider', function($routeProvider) {
    $routeProvider.otherwise({redirectTo: '/view1'});
}]);

