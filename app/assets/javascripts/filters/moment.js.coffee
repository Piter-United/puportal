app = angular.module("app")

app.filter "moment", ()->
  (value) ->
    now = moment()
    date = moment(value)
    now.to(date).toString()
