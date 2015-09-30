app = angular.module("app")

app.controller "RecoverPasswordCtrl", ($scope, $location, Data, $routeParams) ->
  $scope.submit = ()->
    #$location.path("/")
    console.log("recover password")

