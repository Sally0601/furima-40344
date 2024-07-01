class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :preparation

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :region_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :preparation_id, presence: true, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true

def sold_out?
  purchase.present?
  end
end