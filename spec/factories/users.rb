FactoryBot.define do
  factory :user do
    nickname              { 'yayoi' }
    email                 { 'q123@gmail.com' }
    password              { 'abc12345' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '弥生' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'ヤヨイ' }
    birth                 { '2000-01-01' }
  end
end