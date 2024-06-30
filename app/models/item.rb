class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :region
  belongs_to_active_hash :preparation

  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :condition_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :delivery_charge_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :region_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :preparation_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :image, presence: true

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
