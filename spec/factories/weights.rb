FactoryBot.define do
  factory :weight do
    value             { FFaker::Random.rand(40..100) }
    unity             { FFaker::Random.rand(2)       }
    registration_date { Date.current                 }
    user
  end
end
