angular.module("app").controller "EventsCtrl", ($scope, $location, Data, Auth) ->
  $scope.query = null

  $scope.isAuthenticated = ()->
    Auth.isAuthenticated()

  $scope.fetch = ()->
    Data.events.all(day: $scope.selected.toJSON(), q: $scope.query).then (events)->
      $scope.events = events

  $scope.select = (day)->
    $scope.selected = day.date
    $scope.fetch()

  $scope.day = moment();
  $scope.selected = $scope.day;

  $scope.$watch "query", ()-> $scope.fetch()
  $scope.fetch()
