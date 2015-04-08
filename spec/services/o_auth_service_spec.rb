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
    context "absent member" do
      it("registrate new member")     { expect{ service.authenticate(omniauth) }.to change{ Member.count }.to(+1) }
      it("create new authentication") { expect{ service.authenticate(omniauth) }.to change{ Authentication.count }.to(+1) }

      specify "new authentication attribtues" do
        service.authenticate(omniauth)
        auth = Authentication.last
        auth.sn = omniauth.provider
        auth.uid = omniauth.uid
        auth.token = omniauth.credentials.token
        auth.expires_at = Time.at(omniauth.credentials.expires_at)
      end
    end

    context "already registered member" do
      let!(:member)         { create(:member) }
      let!(:authentication) { create(:authentication, omniauth.provider.to_sym, owner: member, uid: omniauth.uid) }

      it("not registrate new member")     { expect{ service.authenticate(omniauth) }.to_not change{ Member.count } }
      it("not create new authentication") { expect{ service.authenticate(omniauth) }.to_not change{ Authentication.count } }
    end
  end

  describe '#link_accounts' do
    let!(:member)         { create(:member) }
    let!(:authentication) { create(:authentication, omniauth.provider.to_sym, owner: member, uid: omniauth.uid) }

    it("not registrate new member")     { expect{ service.link_accounts!(member, omniauth) }.to_not change{ Member.count } }
    it("not create new authentication") { expect{ service.link_accounts!(member, omniauth) }.to_not change{ Authentication.count } }

    it "update token" do
      expect{ service.link_accounts!(member, omniauth) }.to \
      change{ authentication.reload.token }.from(authentication.token).to(omniauth.credentials.token)
    end

    it "update expires at" do
      expect{ service.link_accounts!(member, omniauth) }.to \
      change{ authentication.reload.expires_at }.from(authentication.expires_at).to(Time.at(omniauth.credentials.expires_at))
    end

    context "already linked account" do
      let(:other_member) { create(:member) }

      it("raise already linked account error") { expect{ service.link_accounts!(other_member, omniauth) }.to raise_error(OAuthService::AlreadyLinkedAccount) }
    end
  end

end
