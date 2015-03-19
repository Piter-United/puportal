require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      :address => "MyString",
      :description => "MyText",
      :company_id => 1,
      :photos => "MyText"
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input#place_address[name=?]", "place[address]"

      assert_select "textarea#place_description[name=?]", "place[description]"

      assert_select "input#place_company_id[name=?]", "place[company_id]"

      assert_select "textarea#place_photos[name=?]", "place[photos]"
    end
  end
end
