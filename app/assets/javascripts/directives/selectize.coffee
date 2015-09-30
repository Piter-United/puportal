app = angular.module('app')

app.directive 'selectize', ($timeout) ->
  restrict: 'A'
  scope: false
  link: (scope, element, attrs) ->
    $timeout ->
      opts = scope.$eval(attrs.selectize)

      opts.onChange = (value)->
        scope.$apply ()->
          root = scope
          scopename = $(element).attr('ng-model').split('.')

          # for `scope.a.b.c.d.etc = value` setting
          $.each scopename, (index, propery)->
            if index == (scopename.length - 1)
              root[propery] = value
            else
              root = root[propery]

      $(element).selectize(opts)



