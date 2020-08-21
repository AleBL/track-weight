require "rails_helper"

RSpec.describe TableWeights do
  describe "table weights" do
    let!(:user)           { create(:user) }
    let!(:weights)        { create_list(:weight, 5, user: user) }
    let!(:others_weights) { create_list(:weight, 5,) }

    context "valid" do
      it "is array" do
        table_weight = TableWeights.new(user: user)
        expect(table_weight.transform_table).to be_an_instance_of(Array)
      end

      it "registrations date match" do
        table_weight = TableWeights.new(user: user)
        expect(table_weight.transform_table.map {|item| item.first }).to eq(weights.pluck(:registration_date))
      end

      it "value match" do
        table_weight = TableWeights.new(user: user)
        expect(table_weight.transform_table.map {|item| item.second }).to eq(weights.pluck(:value))
      end
    end

    context "invalid" do
      it "value do not match" do
        table_weight = TableWeights.new(user: user)
        expect(table_weight.transform_table.map {|item| item.second }).not_to eq(others_weights.pluck(:value))
      end
    end
  end
end