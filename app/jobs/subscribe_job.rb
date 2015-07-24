class SubscribeJob < ActiveJob::Base
  def perform(user)
    mailchimp.lists.subscribe(
      id: ENV["MAILCHIMP_LIST"],
      email: { email: user.email },
      double_optin: false
    )
  end

  private

  def mailchimp
    Gibbon::API.new
  end
end
