class ProfileDecorator < Draper::Decorator
  delegate :name

  decorates_association :authentications

  def avatar
    h.image_tag object.avatar
  end

  def absent_authentications
    exists = object.authentications.map(&:provider)
    Authentication.providers.values - exists
  end
end
