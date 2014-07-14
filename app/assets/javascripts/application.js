// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-resource
//= require angular-route
//= require angular-animate
//= require_tree .

var restkastenApp = angular.module('restkastenApp', [
    'ngRoute',
    'ngAnimate',
    'restkastenControllers',
    'restkastenServices'
]);

restkastenApp.config(function($httpProvider){
    // authToken = $("meta[name=\"csrf-token\"]").attr("content");
    // $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});

restkastenApp.config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider) {
        $locationProvider.html5Mode(true);
        $routeProvider.
            when('/users', {
                templateUrl: '/template/userlist',
                controller: 'UserListCtrl'
            }).
            when('/users/:userId', {
                templateUrl: '/template/user',
                controller: 'UserCtrl'
            }).
	    when('/access_objects', {
	        templateUrl: '/template/accobjlist',
		controller: 'AccObjListCtrl'
	    }).
	    when('/access_objects/:aoId', {
	        templateUrl: '/template/accobj',
		controller: 'AccObjCtrl'
	    }).
            otherwise({
                redirectTo: '/users'
            });
    }
]);
