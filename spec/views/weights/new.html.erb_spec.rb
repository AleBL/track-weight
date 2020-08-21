require 'rails_helper'

RSpec.describe "weights/new", type: :view do
  before { assign(:weight, build(:weight)) }

  it "renders new weight form" do
    render

    assert_select "form[action=?][method=?]", weights_path, "post" do
      assert_select "input[name=?]", "weight[value]"
      assert_select "select[name=?]", "weight[unity]"
      assert_select "input[name=?]", "weight[registration_date]"
    end
  end
end