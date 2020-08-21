require 'rails_helper'

RSpec.describe "diets/new", type: :view do
  before { assign(:diet, build(:diet)) }

  it "renders new diet form" do
    render

    assert_select "form[action=?][method=?]", diets_path, "post" do
      assert_select "input[name=?]",  "diet[initial_date]"
      assert_select "input[name=?]",  "diet[end_date]"

      assert_select "input[name=?]",  "diet[initial_weight_attributes][value]"
      assert_select "select[name=?]", "diet[initial_weight_attributes][unity]"
      assert_select "input[name=?]",  "diet[ideal_weight_attributes][value]"
      assert_select "select[name=?]", "diet[ideal_weight_attributes][unity]"
    end
  end
end