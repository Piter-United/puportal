angular.module("app").filter "moment", ()->
  (value) ->
    now = moment()
    date = moment(value)
    now.to(date).toString()
