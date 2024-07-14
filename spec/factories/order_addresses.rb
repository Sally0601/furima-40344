FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    region_id        { 2 }
    city             { '渋谷区' }
    street_address   { '千駄ヶ谷1-1-1' }
    building_name    { 'ABC103' }
    phone_number     { '09012345678' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
