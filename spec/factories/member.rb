FactoryGirl.define do
  factory :member, class: Member do
    association :user,      factory: :user
    association :community, factory: :community
  end
end