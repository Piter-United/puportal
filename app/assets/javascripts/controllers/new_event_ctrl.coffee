angular.module("app").controller "NewEventCtrl", ($scope, $location, Data) ->
  $scope.event = {}
  $scope.errors = {}
  $scope.options = []

  $scope.hasError = (name)->
    !!$scope.errors[name]

  $scope.save = ()->
    event = $scope.event;

    Data.events.create(event)
      .then (result)->
        if result.data && result.data.errors
          $scope.errors = result.data.errors
        else
          $location.path("/events")

  $scope.tagsConfig = ()->
    delimiter: ","
    persist: false
    create: (input) ->
      value: input
      text: input

  $scope.descriptionConfig = ()->
    textarea: null
    basePath: "https://cdnjs.cloudflare.com/ajax/libs/epiceditor/0.2.2"
    clientSideStorage: false
    localStorageName: "epiceditor"
    useNativeFullscreen: true
    parser: marked

    theme:
      base: "/themes/base/epiceditor.css"
      #preview: "/themes/preview/preview-light.css"
      editor: "/themes/editor/epic-light.css"

    button:
      preview: true
      fullscreen: true
      bar: "auto"

    focusOnLoad: false

    string:
      togglePreview: "Toggle Preview Mode"
      toggleEdit: "Toggle Edit Mode"
      toggleFullscreen: "Enter Fullscreen"

    autogrow: false

  $scope.communityConfig = ()->
    valueField: "id",
    labelField: "id",
    searchField: "name",
    options: [],
    create: false,

    load: (query, callback)->
      callback() unless query.length
      Data.communities.all().then (communities)->
        callback(communities)

    render:
      item: (item, escape) ->
        return "<div>#{ escape item.name }</div>"

      option: (item, escape) ->
        return "<div>#{ escape item.name }</div>"
