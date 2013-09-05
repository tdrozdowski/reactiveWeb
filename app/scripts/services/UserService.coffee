'use strict';

angular.module('reactiveApp')
  .service 'UserService',[ '$http', '$q', 'apiHost', ($http, $q, apiHost) ->

    {
      listEmails : () ->
        deferred = $q.defer()

        $http.get("#{apiHost}/users/emails")
          .success (results) ->
            console.log "results ->", results
            deferred.resolve(results)
          .error (data, status) ->
            console.log "Whoops: status: #{status} data: #{data}"
            deferred.reject(data)

        deferred.promise

      getUser : (email) ->
        deferred = $q.defer()

        $http.get("#{apiHost}/user/#{email}")
          .success (user) ->
            console.log "user -> ", user
            deferred.resolve(user)
          .error (data, status) ->
            console.log "Whoops: status: #{status} data: #{data}"
            deferred.reject(data)

        deferred.promise

      updateUser : (user) ->
        $http.put("#{apiHost}/user/#{email}", user)
          .success (results) ->
            console.log "updated"
          .error (e) ->
            console.log "Error ", e
    }
  ]