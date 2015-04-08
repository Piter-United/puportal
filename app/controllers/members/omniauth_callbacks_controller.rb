class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def common
    if member_signed_in?
      link_accounts
    else
      registrate_member
    end
  end

  alias vkontakte common
  alias facebook common
  alias gplus common
  alias github common
  alias linkedin common

  private

  def registrate_member
    @member = oauth.authenticate(omniauth)

    if @member.persisted?
      sign_in_and_redirect @member, event: :authentication #this will throw if @member is not activated
      set_flash_message(:notice, :success, kind: omniauth.provider) if is_navigational_format?
    else
      session["devise.#{ omniauth.provider }_data"] = omniauth
      redirect_to root_path
    end
  end

  def link_accounts
    oauth.link_accounts!(current_member, omniauth)

    redirect_to root_path, notice: :ok
  rescue OAuthService::Error => error
    redirect_to root_path, error: I18n.t!(error.class.name.demodulize.underscore, scope: 'oauth')
  end

  def omniauth
    request.env["omniauth.auth"]
  end

  def oauth
    @oauth ||= OAuthService.new
  end

end