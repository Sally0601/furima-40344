class DeliveryCharge < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '着払い(購入者負担)' },
    { id: 2, name: '送料込み(出品者負担)' }
  ]

  def items
    Item.where(delivery_charge_id: id)
  end
end