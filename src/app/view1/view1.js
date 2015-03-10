'use strict';

var angular = require('angular');

angular.module('myApp.view1', [require('angular-route')])
.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])
.controller('View1Ctrl', [function() {

}]);
