FactoryBot.define do
  factory :user do
    name      { FFaker::Name.name }
    email     { FFaker::Internet.email }
    height    { FFaker::Random.rand(2.0).round(2) }
    password  { FFaker::Internet.password }
  end
end
