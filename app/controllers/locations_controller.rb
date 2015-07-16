class LocationsController < ApplicationController
  SPB_BOUDNS = [
    [59.556020867866025, 29.604035455270864], # SPB BOUNDS
    [60.27887013213398, 31.046079544729135]
  ]

  def index
    authorize! :read, Geocoder

    data = Geocoder.search(params.require(:address), bounds: SPB_BOUDNS)

    locations = data.map do |r|
      {
        address: r.address,
        latitude: r.latitude,
        longitude: r.longitude
      }
    end

    render json: locations
  end
end
