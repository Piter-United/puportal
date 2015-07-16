require 'rails_helper'

RSpec.describe Community, type: :model do
  subject{ create(:community) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name)}

  it { is_expected.to validate_presence_of(:hashtag) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to have_many(:events).class_name("Event").inverse_of(:community) }
  it { is_expected.to have_many(:members).class_name("Member").inverse_of(:community) }
  it { is_expected.to have_many(:users).class_name("User").through(:members) }
end
