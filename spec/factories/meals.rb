FactoryBot.define do
  factory :meal do
    type        { FFaker::Random.rand(4)      }
    eating_time { FFaker::Time.datetime       }
    description { FFaker::Lorem.sentences(20) }
    diet
  end
end
