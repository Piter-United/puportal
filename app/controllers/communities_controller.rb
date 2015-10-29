class CommunitiesController < InheritedResources::Base
  respond_to :json
  before_action :authenticate_user!, except: [:index, :show]

  actions :index, :show, :create, :update, :destroy

  has_scope :fresh, type: :boolean

  def community_params
    params.require(:community).permit(
      :name,
      :hashtag,
      :description,
      :short_name,
      :links,
      :logo,
      :elem,
      :tags
    )
  end
end
