class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @profile = ProfileDecorator.new(current_user)
  end
end
