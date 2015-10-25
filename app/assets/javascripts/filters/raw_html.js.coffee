angular.module("app").filter "rawHtml", ["$sce", ($sce) ->
  ((val) -> $sce.trustAsHtml val)
]