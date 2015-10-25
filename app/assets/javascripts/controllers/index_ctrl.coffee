angular.module("app").controller "IndexCtrl", ($scope, $location, Data) ->
  Data.events.all(forthcoming: true).then (events)->
    $scope.events = events

  Data.communities.all(fresh: true).then (communities)->
    $scope.communities = communities
