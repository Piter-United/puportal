angular.module("app").controller "CommunityCtrl", ($scope, $location, Data, $routeParams, Auth) ->
  $scope.uids = []

  $scope.isAuthenticated = ()->
    Auth.isAuthenticated()

  $scope.isMember = ()->
    Auth._currentUser and (Auth._currentUser.id in $scope.uids)

  $scope.join = ()->
    Data.communities.join($routeParams.id).then (result)->
      $scope.fetch()

  $scope.leave = ()->
    Data.communities.leave($routeParams.id).then (result)->
      $scope.fetch()

  $scope.fetch = ()->
    Data.communities.find($routeParams.id).then (community)->
      $scope.community = community
      $scope.uids = $.map(community.users, (user)-> user.id)

    Data.events.all("communities[]": [$routeParams.id]).then (events)->
      $scope.events = events

  $scope.fetch()
