require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let(:community) { create(:community) }

  describe "POST create", authenticated: :user, authorized: { create: Member } do
    before { expect(controller).to receive(:authenticate_user!) }
    before { post :create, community_id: community.id }

    it { expect(response.code).to eq("201") }
  end

  describe "DELETE destroy", authenticated: :user, authorized: { destroy: Member } do
    let(:member) { create(:member) }

    before { expect(controller).to receive(:authenticate_user!) }
    before { delete :destroy, community_id: community.id }

    it { expect(response.code).to eq("204") }
  end
end