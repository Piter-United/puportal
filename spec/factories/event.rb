FactoryGirl.define do
  factory :event, class: Event do
    title
    description
    date        { Date.today + rand(10).days }
    start       { Time.now }
    finish      { |e| e.start + 1.hour }

    association :community, factory: :community
  end
end