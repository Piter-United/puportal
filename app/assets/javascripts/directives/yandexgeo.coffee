angular.module('app').directive 'yandexgeo', ($timeout)->
  options = ()->
    valueField: 'coordinates',
    labelField: 'coordinates',
    searchField: 'address',
    options: [],
    create: false,

    load: (query, callback)->
      callback() unless query.length
      console.log('geoqeury', query)

      ymaps.geocode(query, { house: "house" }).then (result)->
        data = []
        #window.geo = result

        result.geoObjects.each (geoObject)->
          coordinates = geoObject.geometry.getCoordinates()

          data.push {
            address: geoObject.properties.get('name'),
            coordinates: coordinates,
            properties: geoObject.properties.getAll()
          }

        callback(data)

    render:
      item: (item, escape) ->
        return "<div>#{ escape item.address }</div>"

      option: (item, escape) ->
        result = "<div class='geo-object'>"
        result += "<h5>#{ escape item.address }</h5>"
        result += "<h6>#{ item.properties.description }</h6>" if item.properties.description
        result += "</div>"
        return result

  return {
    restrict: 'A'
    scope: false
    link: (scope, element, attrs, modelCtrl) ->
      $timeout ->
        opts = options()
        opts.onChange = (value)->
          scope.$apply ()->
            root = scope
            scopename = $(element).attr('ng-model').split('.')

            # for `scope.a.b.c.d.etc = value` setting
            $.each scopename, (index, propery)->
              if index == (scopename.length - 1)
                root[propery] = value
              else
                root = root[propery]

        $(element).selectize(opts)
  }
