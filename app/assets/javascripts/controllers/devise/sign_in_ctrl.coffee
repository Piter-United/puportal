app = angular.module("app")

app.controller "SignInCtrl", ($scope, $location, Auth) ->
  $scope.error = ''
  $scope.credentials = {}
  $scope.config = headers:
    "X-HTTP-Method-Override": "POST"

  $scope.submit = ()->
    Auth.login($scope.credentials, $scope.config).then ((user) ->
      $location.path("/")
    ), (response) ->
      $scope.error = response.data.error