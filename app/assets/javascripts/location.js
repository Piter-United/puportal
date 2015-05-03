$(function(){
  $('.location').each(function(index, location){
    var $address = $(location).find('.location_address')
    var $latitude = $(location).find('.location_latitude')
    var $longitude = $(location).find('.location_longitude')

    $address.select2({
      width: '100%',
      placeholder: "Адрес",
      minimumInputLength: 5,

      ajax: {
        url: "/locations",
        dataType: 'json',
        quietMillis: 250,
        data: function (term, page) {
          return { address: term };
        },
        results: function (data, page) {
          var addresses = $.map(data.locations, function(address, index){
            return {
              id: address.address,
              title: address.address,
              latitude: address.latitude,
              longitude: address.longitude
            }
          })

          return { results: addresses };
        },
        cache: true
      },

      formatResult: function(data){
        return data.title;
      },

      formatSelection: function(address){
        return address.title
      },
    });

    $address.select2("data", {
      id: $address.val(),
      title: $address.val(),
      latitude: $latitude.val(),
      longitude: $longitude.val()
    });

    $address.on('select2-selecting', function(e) {
      $latitude.val(e.choice.latitude)
      $longitude.val(e.choice.longitude)
    });

  });
});
