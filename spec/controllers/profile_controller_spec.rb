require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "GET show", authenticated: :user do
    before { expect(controller).to receive(:authenticate_user!) }
    before { get :show }

    it { expect(response.code).to eq("200") }
  end
end