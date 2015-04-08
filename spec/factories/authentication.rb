FactoryGirl.define do
  sequence(:token) { |n| "token#{ n }" }

  factory :authentication, class: Authentication do
    token
    expires_at { Time.now + 1.day }

    Authentication.sns.each do |type, value|
      trait type.to_sym do
        sn value
      end
    end
  end

end