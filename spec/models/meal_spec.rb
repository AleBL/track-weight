require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { is_expected.to validate_presence_of(:description)  }
  it { is_expected.to validate_presence_of(:eating_time)  }
  it { is_expected.to validate_presence_of(:kind)         }
  it { is_expected.to belong_to(:diet)                    }
end
