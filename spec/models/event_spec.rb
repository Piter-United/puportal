require 'rails_helper'

RSpec.describe Event, type: :model do
  subject{ create(:event) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:start) }
  it { is_expected.to validate_presence_of(:finish) }
  it { is_expected.to validate_presence_of(:description)}

  it { is_expected.to belong_to(:community).class_name("Community").inverse_of(:events) }
end
