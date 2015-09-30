app = angular.module('app')

app.directive 'timepicker', ($timeout) ->
  restrict: 'A'
  scope: false
  link: (scope, element, attrs) ->
    $timeout ->
      $(element).datetimepicker() #format: 'dd.mm.yyyy hh:ii'
        .on 'dp.change', (ev)->
          scope.$parent.$apply ()->
            root = scope
            scopename = $(element).attr('ng-datetime-model').split('.')

            # for `scope.a.b.c.d.etc = value` setting
            $.each scopename, (index, propery)->
              if index == (scopename.length - 1)
                root[propery] = ev.date.toJSON()
              else
                root = root[propery]
