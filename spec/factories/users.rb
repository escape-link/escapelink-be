FactoryBot.define do
  factory :user do
    nickname { Faker::Superhero.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
