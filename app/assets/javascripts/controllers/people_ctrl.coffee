angular.module("app").controller "PeopleCtrl", ($scope, $location, Data) ->
  Data.profile().then (profile)->
    $scope.profile = profile
