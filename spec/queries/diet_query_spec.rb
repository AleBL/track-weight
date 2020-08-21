require 'rails_helper'

RSpec.describe DietQuery do
  describe "weights" do
    let!(:user)           { create(:user) }
    let!(:diets)          { create_list(:diet, 5, user: user) }
    let!(:others_diets)   { create_list(:diet, 5) }

    it "valid" do
      expect(described_class.diets(user)).to eq(diets)
    end

    it "invalid" do
      expect(described_class.diets(user)).not_to eq(others_diets)
    end
  end
end