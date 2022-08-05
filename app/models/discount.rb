class Discount < ApplicationRecord
  has_many :bills, dependent: :destroy

  validates :name, presence: true
  validates :discount_rate, presence: true
  validates :quantity, presence: true
  validates :condition, presence: true
  validates :expired_at, presence: true
end
