var townsApp = angular.module('townsApp', [
	'ngResource',
	'ngRoute',
	'ui.bootstrap',
	'ngAnimate'
]);


townsApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/countries', {
        templateUrl: '/common/templates/viewChangeCountry.html',
        controller: 'myController'
      });
  }]);