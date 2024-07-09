class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :region_id, :city, :street_address, :building_name, :phone_number


  with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city
  validates :street_address
  validates :phone_number, format: {with: /\A[0-9]{10,11}+\z/, message: "is invalid"}
  validates :user_id
  validates :item_id

end

def save
  order = Order.create(item_id: item_id, user_id: user_id)

  Address.create(order_id: order.id,postal_code: postal_code, region_id: region_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number)
end

end