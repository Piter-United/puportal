require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :name => "Name",
      :links => "MyText",
      :email => "Email",
      :login => "Login",
      :password => "MyText",
      :avatar => "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Avatar/)
  end
end
