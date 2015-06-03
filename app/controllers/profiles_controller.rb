class ProfilesController < ApplicationController
  def show
    @profile = ProfileDecorator.new(current_member)
  end
end
