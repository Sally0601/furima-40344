FactoryBot.define do
  factory :item do
    image                { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.png'), 'image/png') }
    name                 { Faker::Lorem.characters(number: 40) }
    description          { Faker::Lorem.characters(number: 1000) }
    category_id          { 2 }
    condition_id         { 3 }
    delivery_charge_id   { 2 }
    region_id            { 15 }
    preparation_id       { 2 }
    price                { 5000 }
    association :user
  end
end