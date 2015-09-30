app = angular.module("app")

app.controller "CommunitiesCtrl", ($scope, $location, Data, $routeParams, Auth) ->
  $scope.isAuthenticated = ()->
    Auth.isAuthenticated()

  Data.communities.all().then (communities)->
    $scope.communities = communities
