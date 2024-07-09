FactoryBot.define do
  factory :order_address do
    postal_code         { '000-0000' }
    region_id           {1}
    city                { '東京都' }
    street_address      { '渋谷1-1' }
    building_name       { 'アイウエビル'}
    phone_number        { '08011112222' }

  end
end
