class OAuthService
  include Transactions

  Error = Class.new(StandardError)
  AlreadyLinkedAccount = Class.new(OAuthService::Error)

  def authenticate(omniauth)
    transaction do
      authentication = build_authentication(omniauth)
      authentication.owner = registrate_member(omniauth) if authentication.new_record?
      authentication.save!
      authentication.owner
    end
  end

  def link_accounts!(member, omniauth)
    transaction do
      authentication = build_authentication(omniauth)

      fail AlreadyLinkedAccount if authentication.persisted? && authentication.owner != member

      authentication.owner = member
      authentication.save!
    end
  end

  private

  def build_authentication(omniauth)
    authentication = Authentication.by_auth(omniauth).first_or_initialize
    authentication.token = omniauth.credentials.token
    authentication.expires_at = Time.zone.at(omniauth.credentials.expires_at)
    authentication
  end

  def registrate_member(omniauth)
    Member.create! do |member|
      member.oauth = true
      member.name ||= omniauth.info.name
      member.avatar ||= omniauth.info.image
      member.skip_confirmation!
    end
  end
end
