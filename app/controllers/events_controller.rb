class EventsController < InheritedResources::Base
  skip_before_action :authenticate_user!, only: [:index, :show]

  has_scope :day
  has_scope :forthcoming
  has_scope :communities, type: :array

  actions :index, :show, :create, :update, :destroy

  def event_params
    params.require(:event).permit(
      :title,
      :community_id,
      :start,
      :finish,
      :tags,
      :description,
      location: [:address, :latitude, :longitude]
    )
  end

  protected

  def end_of_association_chain
    super.includes(:community)
  end
end
