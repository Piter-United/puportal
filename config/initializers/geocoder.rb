Geocoder.configure(
  timeout: 5,
  lookup: :google,
  units: :km,
  use_https: true,
  language: :ru,
  api_key: "AIzaSyA1uCxQ1RS8_8vyNMlkolXsUIZ-IJTwP5s",
  logger: Rails.logger,
  cache: Rails.cache
)