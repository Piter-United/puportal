require 'rails_helper'

RSpec.describe "communities/show", type: :view do
  before(:each) do
    @community = assign(:community, Community.create!(
      :name => "Name",
      :description => "MyText",
      :leaders => "MyText",
      :site => "Site",
      :vk => "Vk",
      :facebook => "Facebook",
      :twitter => "Twitter",
      :meetupcom => "Meetupcom",
      :google => "Google"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Site/)
    expect(rendered).to match(/Vk/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Meetupcom/)
    expect(rendered).to match(/Google/)
  end
end
