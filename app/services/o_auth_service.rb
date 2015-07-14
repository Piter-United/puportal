class OAuthService
  include Transactions

  Error = Class.new(StandardError)
  AlreadyLinkedAccount = Class.new(OAuthService::Error)

  def authenticate(omniauth)
    transaction do
      authentication = build_authentication(omniauth)
      authentication.owner = registrate_user(omniauth) if authentication.new_record?
      authentication.save!
      authentication.owner
    end
  end

  def link_accounts!(user, omniauth)
    transaction do
      authentication = build_authentication(omniauth)

      fail AlreadyLinkedAccount if authentication.persisted? && authentication.owner != user

      authentication.owner = user
      authentication.save!
    end
  end

  private

  def build_authentication(omniauth)
    authentication = Authentication.by_auth(omniauth).first_or_initialize
    authentication.token = omniauth.credentials.token

    if omniauth.credentials.expires_at
      authentication.expires_at = Time.zone.at(omniauth.credentials.expires_at)
    end

    authentication
  end

  def registrate_user(omniauth)
    User.create! do |user|
      user.oauth = true
      user.name ||= omniauth.info.name
      user.avatar ||= omniauth.info.image
      user.skip_confirmation!
    end
  end
end
