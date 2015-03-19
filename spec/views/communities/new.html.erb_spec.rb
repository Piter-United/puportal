require 'rails_helper'

RSpec.describe "communities/new", type: :view do
  before(:each) do
    assign(:community, Community.new(
      :name => "MyString",
      :description => "MyText",
      :leaders => "MyText",
      :site => "MyString",
      :vk => "MyString",
      :facebook => "MyString",
      :twitter => "MyString",
      :meetupcom => "MyString",
      :google => "MyString"
    ))
  end

  it "renders new community form" do
    render

    assert_select "form[action=?][method=?]", communities_path, "post" do

      assert_select "input#community_name[name=?]", "community[name]"

      assert_select "textarea#community_description[name=?]", "community[description]"

      assert_select "textarea#community_leaders[name=?]", "community[leaders]"

      assert_select "input#community_site[name=?]", "community[site]"

      assert_select "input#community_vk[name=?]", "community[vk]"

      assert_select "input#community_facebook[name=?]", "community[facebook]"

      assert_select "input#community_twitter[name=?]", "community[twitter]"

      assert_select "input#community_meetupcom[name=?]", "community[meetupcom]"

      assert_select "input#community_google[name=?]", "community[google]"
    end
  end
end
