'use strict'

angular.module('reactiveApp', ['ngRoute'])
  .value('apiHost', 'http://localhost:9000')

  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/demo',
        templateUrl: 'views/demo.html',
        controller: 'DemoCtrl'
        resolve :
          emails : [ 'UserService', (UserService) ->
              UserService.listEmails()
            ]
      .otherwise
        redirectTo: '/'
  ]
