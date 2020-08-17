require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let!(:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    
    it { is_expected.to validate_presence_of(:email)  }
    it { is_expected.to validate_presence_of(:height) }
    it { is_expected.to validate_presence_of(:name)   }
  end
end