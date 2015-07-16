class MembershipsController < ApplicationController
  def create
    authorize! :create, Member

    current_user.members.where(community_id: params[:community_id]).first_or_create!
    redirect_to :back, notice: "By by"
  end

  def destroy
    authorize! :destroy, Member

    current_user.members.where(community_id: params[:community_id]).delete_all
    redirect_to :back, notice: "Welcome"
  end
end
