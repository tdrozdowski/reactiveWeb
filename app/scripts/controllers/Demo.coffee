'use strict'

angular.module('reactiveApp')
  .controller 'DemoCtrl', ['$scope', 'emails', 'UserService', 'apiHost', ($scope, emails, UserService, apiHost) ->
      $scope.emails = emails
      $scope.complaint = ""
      $scope.complaints = []

      ws = new WebSocket("ws://localhost:9000/complaints")

      ws.onopen = () ->
        console.log "Socket is open for business..."

      ws.onmessage = (response) ->
        console.log "Received a response from WS: ", response
        $scope.$apply($scope.complaints.push(JSON.parse(response.data)))
        scrollDiv = document.getElementById("whiners")
        scrollDiv.scrollTop = scrollDiv.scrollHeight

      ws.onclose = () ->
        console.log "WS closed..."

      $scope.whine = () ->
        complaint =
          user : $scope.user.email
          complaint : $scope.complaint
          time : moment().valueOf()
        ws.send(JSON.stringify(complaint))
        $scope.complaint = ""

      $scope.userSelected = () ->
        UserService.getUser($scope.selectedUser)
          .then (user) ->
            $scope.user = user
            $scope.imageUrl = if (user.profilePic?) then "#{apiHost}/user/#{$scope.selectedUser}/profilePic" else null
            console.log "image Url #{$scope.imageUrl}"
          , (e) ->
            $scope.user = $scope.$initial

      $scope.update = () ->
        UserService.updateUser($scope.user)
          .then (results) ->
            $scope.results = "Updated!"
          , (e) ->
            $scope.results = "Error Occurred!"

  ]
