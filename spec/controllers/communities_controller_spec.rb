require 'rails_helper'

RSpec.describe CommunitiesController, type: :controller do
  describe "GET index", authorized: { read: Community } do
    before { expect(controller).to_not receive(:authenticate_user!) }
    before { get :index }

    it { expect(response.code).to eq("200") }
    it { expect(response).to render_template("index") }
  end

  describe "POST create", authenticated: :user, authorized: { create: Community } do
    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { post :create, community: attributes_for(:community) }

      it { expect(response).to redirect_to(community_url(Community.last)) }
      it { expect(flash[:notice]).to eq("Community was successfully created.") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(false) }
      before { post :create, community: attributes_for(:community) }

      it { expect(response.code).to eq("200") }
      it { expect(response).to render_template("new") }
    end
  end

  describe "PATCH update", authenticated: :user, authorized: { update: Community } do
    let(:community) { create(:community) }

    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { patch :update, id: community.id, community: attributes_for(:community) }

      it { expect(response).to redirect_to(community_url(community)) }
      it { expect(flash[:notice]).to eq("Community was successfully updated.") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(false) }
      before { patch :update, id: community.id, community: attributes_for(:community) }

      it { expect(response.code).to eq("200") }
      it { expect(response).to render_template("edit") }
    end
  end

  describe "DELETE destroy", authenticated: :user, authorized: { destroy: Community } do
    let(:community) { create(:community) }

    before { expect(controller).to receive(:authenticate_user!) }
    before { delete :destroy, id: community.id }

    it { expect(response).to redirect_to(communities_url) }
    it { expect(flash[:notice]).to eq("Community was successfully destroyed.") }
  end
end
