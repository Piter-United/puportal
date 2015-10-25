angular.module('app').directive 'epiceditor', ($timeout) ->
  restrict: 'A'
  scope: false
  link: (scope, element, attrs) ->
    $timeout ->
      options = scope.$eval(attrs.epiceditor)
      options.container = element[0].parentNode
      options.textarea = element[0]
      $(options.textarea).hide()

      editor = new EpicEditor(options)
      editor.load()

      editor.on 'update', (value)->
        scope.$apply ()->
          root = scope
          scopename = $(element).attr('ng-model').split('.')

          # for `scope.a.b.c.d.etc = value` setting
          $.each scopename, (index, propery)->
            if index == (scopename.length - 1)
              root[propery] = value.content
            else
              root = root[propery]

      $(options.container).attr('style','')
