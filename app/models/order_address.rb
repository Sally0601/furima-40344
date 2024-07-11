class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id, :token,
                :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, region_id:, city:, street_address:,
                   building_name:, phone_number:, order_id: order.id).persisted?
  end
end
