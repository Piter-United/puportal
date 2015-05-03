class CommunitiesController < ApplicationController
  before_action :find_community, only: [:show, :edit, :update, :destroy]

  def index
    @communities = Community.all
    @community_decorators = @communities.decorate

    respond_to do |format|
      format.html
      format.json { render json: @communities, each_serializer: CommunitySerializer }
    end
  end

  def show
  end

  def new
    @community = Community.new
  end

  def edit
  end

  def create
    @community = Community.new(community_params)

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @community.destroy

    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
    end
  end

  private

  def find_community
    @community = Community.find(params[:id])
    @community_decorator = @community.decorate
  end

  def community_params
    params.require(:community).permit(
      :name,
      :description,
      :logo,
      :hashtag,
      :tags
    )
  end
end
