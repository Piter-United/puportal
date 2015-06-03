class AuthenticationDecorator < Draper::Decorator
  delegate_all

  def link
    case provider.to_sym
    when :vkontakte
      h.link_to provider, "http://vk.com/id#{ uid }"
    when :facebook
      h.link_to provider, "http://facebook.com/#{ uid }"
    when :gplus
      h.link_to provider, "http://plus.google.com/#{ uid }"
    when :github
      h.link_to provider, "http://github.com/#{ uid }"
    end
  end

end
