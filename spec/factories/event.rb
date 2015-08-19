FactoryGirl.define do
  factory :event, class: Event do
    title
    description
    start       { Time.now }
    finish      { |e| e.start + 1.hour }

    association :community, factory: :community
  end
end