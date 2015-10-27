angular.module("app").controller "UsersCtrl", ($scope, $location, Data) ->
  $scope.fetch = ()->
    Data.users.all(q: $scope.query).then (people)->
      $scope.people = people

  $scope.$watch "query", ()-> $scope.fetch()
  $scope.fetch()