FactoryBot.define do
  factory :user do
    nickname              {"suzuki"}
    email                 {Faker::Internet.free_email}
    password              {"00000a"}
    password_confirmation {password}
  end
end