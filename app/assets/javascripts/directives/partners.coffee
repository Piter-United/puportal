angular.module("app").directive "partners", ["Data", (Data)->
  restrict: "E"
  template: JST["views/directives/partners"]
  link: (scope, element, attrs) ->
    Data.partners.all().then (partners)->
      scope.partners = partners
]