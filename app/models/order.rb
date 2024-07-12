class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :destination

  validates :item_id, presence: true
  validates :user_id, presence: true
end
