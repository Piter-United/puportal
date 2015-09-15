require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET /events", authorized: { read: Event } do
    before { expect(controller).to_not receive(:authenticate_user!) }
    before { get :index }

    it { expect(response.code).to eq("200") }
  end

  describe "POST create", authenticated: :user, authorized: { create: Event } do
    let(:community) { create(:community) }

    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { allow_any_instance_of(Event).to receive(:save).and_return(true) }
      before { post :create, event: attributes_for(:event).merge(community_id: community.id) }

      it { expect(response.code).to eq("201") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Event).to receive(:save).and_return(false) }
      before { allow_any_instance_of(Event).to receive(:errors).and_return(errors(base: 'invalid')) }
      before { post :create, event: attributes_for(:event).merge(community_id: community.id) }

      it { expect(response.code).to eq("422") }
    end
  end

  describe "PATCH update", authenticated: :user, authorized: { update: Event } do
    let!(:event) { create(:event) }

    before { expect(controller).to receive(:authenticate_user!) }

    context "valid attributes" do
      before { allow_any_instance_of(Event).to receive(:save).and_return(true) }
      before { patch :update, id: event.id, event: attributes_for(:event) }

      it { expect(response.code).to eq("204") }
    end

    context "invalid attributes" do
      before { allow_any_instance_of(Event).to receive(:save).and_return(false) }
      before { allow_any_instance_of(Event).to receive(:errors).and_return(errors(base: 'invalid')) }
      before { patch :update, id: event.id, event: attributes_for(:event) }

      it { expect(response.code).to eq("422") }
    end
  end

  describe "DELETE destroy", authenticated: :user, authorized: { destroy: Event } do
    let!(:event) { create(:event) }

    before { expect(controller).to receive(:authenticate_user!) }
    before { delete :destroy, id: event.id }

    it { expect(response.code).to eq("204") }
  end
end