app = angular.module("app")

app.controller "ProfileCtrl", ($scope, $location, Data) ->
  Data.profile().then (profile)->
    $scope.profile = profile
