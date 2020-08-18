FactoryBot.define do
  factory :diet do
    initial_date   { Date.today     }
    end_date       { Date.tomorrow  }
    initial_weight { build(:weight) }
    ideal_weight   { build(:weight) }
    user
  end
end
