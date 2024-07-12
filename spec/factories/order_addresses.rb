FactoryBot.define do
  factory :order_address do
    postal_code         { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    region_id           { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Lorem.characters(number: 10) }
    street_address      { Faker::Lorem.characters(number: 10) }
    building_name       { Faker::Lorem.characters(number: 10) }
    phone_number        { Faker::Number.between(from: 10**9, to: 10**11) }
    token               { 'tok_abcdefghijk00000000000000000' }
    price               { 500 }
  end
end
