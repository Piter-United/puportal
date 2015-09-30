app = angular.module("app")

app.controller "EventCtrl", ($scope, $location, Data, $routeParams, Auth) ->
  $scope.isAuthenticated = ()->
    Auth.isAuthenticated()

  Data.events.find($routeParams.id).then (event)->
    $scope.event = event
