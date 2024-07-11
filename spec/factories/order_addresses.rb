FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    region_id           { 2 }
    city                { '東京都' }
    street_address      { '渋谷1-1-1' }
    building_name       { 'アイウエビル100' }
    phone_number        { '08011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
