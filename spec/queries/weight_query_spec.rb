require 'rails_helper'

RSpec.describe WeightQuery do
  describe "weights" do
    let!(:user)           { create(:user) }
    let!(:weights)        { create_list(:weight, 5, user: user) }
    let!(:others_weights) { create_list(:weight, 5) }

    it "valid" do
      expect(described_class.weights(user)).to eq(weights)
    end

    it "invalid" do
      expect(described_class.weights(user)).not_to eq(others_weights)
    end
  end
end