require 'rails_helper'

RSpec.describe OAuthService do
  let(:service) { OAuthService.new }

  let(:omniauth) do
    double({
      provider: 'vkontakte',
      uid: '1',
      credentials: double(token: '100500', expires_at: (Time.now + 1.day).to_i),
      info: double(name: 'username', image: 'http://example.com/path/to/avatar.jpg')
    })
  end

  describe '#authenticate' do
    context "absent user" do
      it("registrate new user")       { expect{ service.authenticate(omniauth) }.to change{ User.count }.to(+1) }
      it("create new authentication") { expect{ service.authenticate(omniauth) }.to change{ Authentication.count }.to(+1) }

      specify "new authentication attribtues" do
        service.authenticate(omniauth)
        auth = Authentication.last
        auth.provider = omniauth.provider
        auth.uid = omniauth.uid
        auth.token = omniauth.credentials.token
        auth.expires_at = Time.at(omniauth.credentials.expires_at)
      end
    end

    context "already registered user" do
      let!(:user)           { create(:user) }
      let!(:authentication) { create(:authentication, omniauth.provider.to_sym, owner: user, uid: omniauth.uid) }

      it("not registrate new user")       { expect{ service.authenticate(omniauth) }.to_not change{ User.count } }
      it("not create new authentication") { expect{ service.authenticate(omniauth) }.to_not change{ Authentication.count } }
    end
  end

  describe '#link_accounts' do
    let!(:user)           { create(:user) }
    let!(:authentication) { create(:authentication, omniauth.provider.to_sym, owner: user, uid: omniauth.uid) }

    it("not registrate new user")       { expect{ service.link_accounts!(user, omniauth) }.to_not change{ User.count } }
    it("not create new authentication") { expect{ service.link_accounts!(user, omniauth) }.to_not change{ Authentication.count } }

    it "update token" do
      expect{ service.link_accounts!(user, omniauth) }.to \
      change{ authentication.reload.token }.from(authentication.token).to(omniauth.credentials.token)
    end

    it "update expires at" do
      expect{ service.link_accounts!(user, omniauth) }.to change{ authentication.reload.expires_at }
    end

    context "already linked account" do
      let(:other_user) { create(:user) }

      it("raise already linked account error") { expect{ service.link_accounts!(other_user, omniauth) }.to raise_error(OAuthService::AlreadyLinkedAccount) }
    end
  end

end
