class MembershipsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def create
    authorize! :create, Member
    member = current_user.members.where(community_id: params[:community_id]).first_or_create!
    respond_with member, location: nil
  end

  def destroy
    authorize! :destroy, Member
    member = current_user.members.where(community_id: params[:community_id]).delete_all
    respond_with member, location: nil
  end
end
