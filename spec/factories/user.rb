FactoryGirl.define do
  factory :user, class: User do
    email
    password

    before :build do |user|
      user.password_confirmation = user.password
    end

    trait :confirmed do
      confirmed_at { Time.now }
    end
  end
end