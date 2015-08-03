//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require select2
//= require select2_locale_ru
//= require marked
//= require lepture_editor
//= require retina
//= require location
//= require editor
//= require community_tags
//= require event_tags
//= require picker.time
//= require_self

$(function(){
  $(".select2").select2({
    width: "100%",
  });

  $(".datepicker").pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15     // Creates a dropdown of 15 years to control year
  });

  $(".timepicker").pickatime()
  $(".parallax").parallax();
  $(".button-collapse").sideNav();
  $('.fixed-action-btn').openFAB();
})