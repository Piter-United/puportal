angular.module("app").directive "map", ["$timeout", ($timeout)->
  restrict: "E"
  template: JST["views/directives/map"]
  link: (scope, element, attrs) ->
    scope.map = null

    load_yandex_map = (cb)->
      script = document.createElement("script")
      script.onload = -> ymaps.ready(cb)
      script.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU"
      document.getElementsByTagName("head")[0].appendChild(script)

    render_map = -> # https://constructor.maps.yandex.ru/location-tool/
      map = new ymaps.Map(document.getElementById("canvas-map"), {
        center: [59.96821584189367,30.30916906344603]
        zoom: 16
        controls: []
      })

      map.behaviors.disable('drag')
      map.behaviors.disable('scrollZoom')
      map.behaviors.disable('dblClickZoom')
      map.behaviors.disable('rightMouseButtonMagnifier')
      map.behaviors.disable('leftMouseButtonMagnifier')
      map.behaviors.disable('ruler')
      map.behaviors.disable('routeEditor')

      my_placemark = new ymaps.Placemark([59.969151711285484,30.316893825408926], {
        hintContent: '“Club House”',
        balloonContent: '“Club House”'
      })

      map.geoObjects.add(my_placemark)

      scope.map = map

    destroy = ->
      scope.map.destroy() if scope.map

    if typeof (ymaps) is "undefined"
      load_yandex_map(render_map)
    else
      render_map()

    scope.$on("$destroy", destroy)
]