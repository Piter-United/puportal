angular.module("app").controller "NewCommunityCtrl", ($scope, $location, Data) ->
  $scope.errors = {}
  $scope.community = {}

  $scope.hasError = (name)->
    !!$scope.errors[name]

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
      preview: "/themes/preview/preview-light.css"
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

  $scope.save = ()->
    community = $scope.community;

    Data.communities.create(community)
      .then (result)->
        if result.data && result.data.errors
          $scope.errors = result.data.errors
        else
          $location.path("/communities")
