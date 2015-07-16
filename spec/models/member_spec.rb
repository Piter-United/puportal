require 'rails_helper'

RSpec.describe Member, type: :model do
  subject{ create(:member) }

  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:community_id) }
  it { is_expected.to validate_presence_of(:community_id) }

  it { is_expected.to belong_to(:user).class_name("User").inverse_of(:members) }
  it { is_expected.to belong_to(:community).class_name("Community").inverse_of(:members) }
end
