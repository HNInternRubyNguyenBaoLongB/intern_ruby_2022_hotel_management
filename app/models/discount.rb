class Discount < ApplicationRecord
  validates :name, presence: true
  validates :discount_rate, presence: true
  validates :quantity, presence: true
  validates :condition, presence: true
  validates :expired_at, presence: true
end
