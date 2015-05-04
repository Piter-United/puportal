FactoryGirl.define do
  factory :community, class: Community do
    name
    description
    hashtag
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'test.png')) }
    tags
  end
end