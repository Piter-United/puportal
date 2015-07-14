module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def common
      if user_signed_in?
        link_accounts
      else
        registrate_user
      end
    end

    alias_method :vkontakte, :common
    alias_method :facebook,  :common
    alias_method :gplus,     :common
    alias_method :github,    :common

    private

    def registrate_user
      @user = oauth.authenticate(omniauth)

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: omniauth.provider) if is_navigational_format?
      else
        session["devise.#{ omniauth.provider }_data"] = omniauth
        redirect_to root_path
      end
    end

    def link_accounts
      oauth.link_accounts!(current_user, omniauth)

      redirect_to root_path, notice: :ok
    rescue OAuthService::Error => error
      redirect_to root_path, error: I18n.t!(error.class.name.demodulize.underscore, scope: "oauth")
    end

    def omniauth
      request.env["omniauth.auth"]
    end

    def oauth
      @oauth ||= OAuthService.new
    end
  end
end
