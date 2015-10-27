angular.module("app").controller "UserCtrl", ($scope, $location, Data, $routeParams, Auth) ->
  Data.users.find($routeParams.id).then (user)->
    $scope.user = user
