FactoryBot.define do
  factory :item do
    name               { 'test' }
    description        { 'test' }
    category_id        { 2 }
    condition_id       { 2 }
    delivery_charge_id { 2 }
    region_id          { 2 }
    preparation_id     { 2 }
    price              { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public', 'images', 'test.png')), filename: 'test.png',
                        content_type: 'image/png')
    end
  end
end
