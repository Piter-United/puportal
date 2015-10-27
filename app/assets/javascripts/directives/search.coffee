angular.module("app").directive "search", ->
  restrict: "AE"
  template: JST["views/directives/search"]
  scope: false