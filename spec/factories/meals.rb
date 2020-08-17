FactoryBot.define do
  factory :meal do
    type { 1 }
    eating_time { "2020-08-17 18:37:34" }
    description { "MyText" }
    diet { nil }
  end
end
