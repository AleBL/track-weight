require 'rails_helper'

RSpec.describe Weight, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:unity) }
    it { is_expected.to validate_presence_of(:user)  }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to belong_to(:user)             }

    it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
  
    it { is_expected.to     allow_value(Date.yesterday).for(:registration_date) }
    it { is_expected.to     allow_value(Date.today)    .for(:registration_date) }
    it { is_expected.to_not allow_value(Date.tomorrow) .for(:registration_date) }
    it { is_expected.to     allow_value(nil)           .for(:registration_date) }
  end
end
