class ProfilesController < ApplicationController
  def show
    @profile = ProfileDecorator.new(current_user)
  end
end
