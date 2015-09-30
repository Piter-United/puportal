app = angular.module("app")

app.controller "EventsCtrl", ($scope, $location, Data, Auth) ->
  $scope.isAuthenticated = ()->
    Auth.isAuthenticated()

  $scope.fetch = ()->
    Data.events.all(day: $scope.selected.toJSON()).then (events)->
      $scope.events = events

  $scope.select = (day)->
    $scope.selected = day.date
    $scope.fetch()

  $scope.day = moment();
  $scope.selected = $scope.day;
  $scope.fetch()
