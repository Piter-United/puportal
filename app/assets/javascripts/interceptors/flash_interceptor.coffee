angular.module("app").factory "flashHttpInterceptor", ['$q', '$log', '$rootScope', ($q, $log, $rootScope)->
  request: (config) ->
    config

  requestError: (rejection) ->
    $q.reject rejection

  response: (response) ->
    if response.headers("X-Flash-Messages")
      flashes = JSON.parse(response.headers("X-Flash-Messages"))

      for flash, message of flashes
        $rootScope.$broadcast("flash", { type: flash, message: message })
    response

  responseError: (rejection) ->
    $q.reject rejection
]
