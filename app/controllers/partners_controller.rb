class PartnersController < InheritedResources::Base
  respond_to :json
  before_action :authenticate_user!
  actions :index
end
