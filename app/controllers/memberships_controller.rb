class MembershipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    authorize! :create, Member

    current_user.members.where(community_id: params[:community_id]).first_or_create!
    redirect_to community_path(params[:community_id]), notice: "Welcome"
  end

  def destroy
    authorize! :destroy, Member

    current_user.members.where(community_id: params[:community_id]).delete_all
    redirect_to community_path(params[:community_id]), notice: "By by"
  end
end
