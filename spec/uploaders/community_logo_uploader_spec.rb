require 'rails_helper'

RSpec.describe CommunityLogoUploader, type: :uploader, processing: true do
	let(:community) { build(:community) }
  let(:uploader)  { CommunityLogoUploader.new(community, :logo) }
  let(:file)      { open File.join(Rails.root, 'spec', 'support', 'files', 'test.png') }

  before { uploader.store! file }
  after  { uploader.remove! }

  it { expect(uploader).to be_no_larger_than(500, 500) }
  it { expect(uploader.thumb).to be_no_larger_than(100, 100) }
end