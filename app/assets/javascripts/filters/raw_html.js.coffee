app = angular.module("app")

app.filter "rawHtml", ["$sce", ($sce) ->((val) -> $sce.trustAsHtml val)]