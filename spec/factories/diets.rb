FactoryBot.define do
  factory :diet do
    initial_date { Date.today }
    end_date     { Date.tomorrow }
    user         { nil }
  end
end
