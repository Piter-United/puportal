require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :address => "Address",
        :description => "MyText",
        :company_id => 1,
        :photos => "MyText"
      ),
      Place.create!(
        :address => "Address",
        :description => "MyText",
        :company_id => 1,
        :photos => "MyText"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
