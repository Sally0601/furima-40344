FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '弥生' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'ヤヨイ' }
    birth { Faker::Date.birthday }
  end
end