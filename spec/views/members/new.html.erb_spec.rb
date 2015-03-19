require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :name => "MyString",
      :links => "MyText",
      :email => "MyString",
      :login => "MyString",
      :password => "MyText",
      :avatar => "MyString"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "textarea#member_links[name=?]", "member[links]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_login[name=?]", "member[login]"

      assert_select "textarea#member_password[name=?]", "member[password]"

      assert_select "input#member_avatar[name=?]", "member[avatar]"
    end
  end
end
