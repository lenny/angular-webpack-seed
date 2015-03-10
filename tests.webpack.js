window.angular = require('angular');
require('angular-mocks');

var context = require.context('./src', true, /_test\.js$/);
context.keys().forEach(context);

