FactoryGirl.define do
  sequence(:email)    { |n| "email#{ n }@example.com" }
  sequence(:password) { |n| "password#{ n }" }

  factory :member, class: Member do
    email
    password

    before :build do |member|
      member.password_confirmation = member.password
    end

    trait :confirmed do
      confirmed_at { Time.now }
    end
  end
end