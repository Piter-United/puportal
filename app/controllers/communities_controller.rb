class CommunitiesController < InheritedResources::Base
  skip_before_action :authenticate_user!, only: [:index, :show]

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
      :tags
    )
  end
end
