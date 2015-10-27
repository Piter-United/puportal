class PeopleController < InheritedResources::Base
  defaults resource_class: User

  respond_to :json
  before_action :authenticate_user!, except: [:index, :show]

  actions :index, :show
  has_scope :q
end
