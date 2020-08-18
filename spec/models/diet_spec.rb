require 'rails_helper'

RSpec.describe Diet, type: :model do
  subject { build(:diet) }

  it { is_expected.to validate_presence_of(:initial_date) }
  it { is_expected.to validate_presence_of(:end_date)     }

  it { is_expected.to belong_to(:user)                               }
  it { is_expected.to belong_to(:initial_weight).dependent(:destroy) }
  it { is_expected.to belong_to(:ideal_weight)  .dependent(:destroy) }
  it { is_expected.to have_many(:meals)         .dependent(:destroy) }
  
  it { is_expected.to     allow_value(Date.yesterday).for(:initial_date) }
  it { is_expected.to     allow_value(Date.today)    .for(:initial_date) }
  it { is_expected.to_not allow_value(Date.tomorrow) .for(:initial_date) }

  it { is_expected.to_not allow_value(Date.yesterday).for(:end_date) }
  it { is_expected.to     allow_value(Date.today)    .for(:end_date) }
  it { is_expected.to     allow_value(Date.tomorrow) .for(:end_date) }
end
