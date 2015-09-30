app = angular.module("app")

with_deff = ($q, cb)->
  deff = $q.defer()
  cb(deff)
  deff.promise

app.factory "Data", ($http, $q, $cookies, Upload)->
  profile: ->
    with_deff $q, (deff)->
      $http(method: "GET", url: "/profile.json")
        .success (data) ->
          deff.resolve(data)

  events:
    find: (id)->
      with_deff $q, (deff)->
        $http(method: "GET", url: "/events/#{id}.json")
          .success (data) -> deff.resolve(data.event)

    all: (params)->
      with_deff $q, (deff)->
        $http(method: "GET", url: "/events.json", params: params)
          .success (data)->
            deff.resolve(data.events)

    create: (params)->
      with_deff $q, (deff)->
        $http(method: "POST", url: "/events.json", data: { "event" : (params || {}) })
          .then (data) ->
            deff.resolve(data)
          , (data) ->
            deff.resolve(data)

  communities:
    all: (params)->
      with_deff $q, (deff)->
        $http(method: "GET", url: "/communities.json", params: params)
          .success (data) ->
            deff.resolve(data.communities)

    find: (id)->
      with_deff $q, (deff)->
        $http(method: "GET", url: "/communities/#{id}.json")
          .success (data) ->
            deff.resolve(data.community)

    create: (params, logo)->
      console.log(params, logo)
      Upload.upload(
        url: "/communities.json"
        method: "POST"
        fields: params || {}
        fileFormDataName: "community[logo]"
        file: logo
        formDataAppender: (fd, key, val)->
          if angular.isArray(val)
            angular.forEach val, (v)->
              fd.append("community["+key+"]", v)
          else
            fd.append("community["+key+"]", val)

          console.log("fd", fd)
      )

    join: (id)->
      with_deff $q, (deff)->
        $http(method: "POST", url: "/communities/#{id}/membership.json")
          .success (data) ->
            deff.resolve(data)

    leave: (id)->
      with_deff $q, (deff)->
        $http(method: "DELETE", url: "/communities/#{id}/membership.json")
          .success (data) ->
            deff.resolve(data)
