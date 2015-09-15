require 'rails_helper'

RSpec.describe CommunitiesController, type: :controller do
  describe "GET index", authorized: { read: Community } do
    before { expect(controller).to_not receive(:authenticate_user!) }
    before { get :index }

    it { expect(response.code).to eq("200") }
  end

  describe "POST create", authenticated: :user, authorized: { create: Community } do
    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(true) }
      before { post :create, community: attributes_for(:community) }

      it { expect(response.code).to eq("201") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(false) }
      before { allow_any_instance_of(Community).to receive(:errors).and_return(errors(base: 'invalid')) }
      before { post :create, community: attributes_for(:community) }

      it { expect(response.code).to eq("422") }
    end
  end

  describe "PATCH update", authenticated: :user, authorized: { update: Community } do
    let!(:community) { create(:community) }

    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(true) }
      before { patch :update, id: community.id, community: attributes_for(:community) }

      it { expect(response.code).to eq("204") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Community).to receive(:save).and_return(false) }
      before { allow_any_instance_of(Community).to receive(:errors).and_return(errors(base: 'invalid')) }
      before { patch :update, id: community.id, community: { name: nil } }

      it { expect(response.code).to eq("422") }
    end
  end

  describe "DELETE destroy", authenticated: :user, authorized: { destroy: Community } do
    let!(:community) { create(:community) }

    before { expect(controller).to receive(:authenticate_user!) }
    before { allow_any_instance_of(Community).to receive(:destroy) }
    before { delete :destroy, id: community.id }

    it { expect(response.code).to eq("204") }
  end
end
