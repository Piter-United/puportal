require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    @place = assign(:place, Place.create!(
      :address => "MyString",
      :description => "MyText",
      :company_id => 1,
      :photos => "MyText"
    ))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input#place_address[name=?]", "place[address]"

      assert_select "textarea#place_description[name=?]", "place[description]"

      assert_select "input#place_company_id[name=?]", "place[company_id]"

      assert_select "textarea#place_photos[name=?]", "place[photos]"
    end
  end
end
