require 'rails_helper'

RSpec.describe Authentication, type: :model do
  Authentication.providers.keys.each do |type|
    subject{ create(:authentication, type.to_sym) }

    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token).scoped_to(:provider) }

    it { is_expected.to belong_to(:owner).class_name("User").inverse_of(:authentications) }
  end
end
