require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :name => "Name",
        :links => "MyText",
        :email => "Email",
        :login => "Login",
        :password => "MyText",
        :avatar => "Avatar"
      ),
      Member.create!(
        :name => "Name",
        :links => "MyText",
        :email => "Email",
        :login => "Login",
        :password => "MyText",
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
