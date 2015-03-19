require 'rails_helper'

RSpec.describe "communities/index", type: :view do
  before(:each) do
    assign(:communities, [
      Community.create!(
        :name => "Name",
        :description => "MyText",
        :leaders => "MyText",
        :site => "Site",
        :vk => "Vk",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :meetupcom => "Meetupcom",
        :google => "Google"
      ),
      Community.create!(
        :name => "Name",
        :description => "MyText",
        :leaders => "MyText",
        :site => "Site",
        :vk => "Vk",
        :facebook => "Facebook",
        :twitter => "Twitter",
        :meetupcom => "Meetupcom",
        :google => "Google"
      )
    ])
  end

  it "renders a list of communities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Site".to_s, :count => 2
    assert_select "tr>td", :text => "Vk".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Meetupcom".to_s, :count => 2
    assert_select "tr>td", :text => "Google".to_s, :count => 2
  end
end
