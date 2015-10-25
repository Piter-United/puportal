angular.module("app").controller "SignUpCtrl", ($scope, $location, Auth) ->
  $scope.errors = {}
  $scope.credentials = {}
  $scope.config = headers:
    "X-HTTP-Method-Override": "POST"

  $scope.hasError = (name)->
    !!$scope.errors[name]

  $scope.submit = ()->
    Auth.register($scope.credentials, $scope.config).then ((user) ->
      $location.path("/")
    ), (response) ->
      $scope.errors = response.data.errors
