angular.module("app").controller "ProfileCtrl", ($scope, $location, Data) ->
  Data.profile().then (profile)->
    $scope.profile = profile
