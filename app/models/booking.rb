class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :bill

  enum status: {
    pending: 0,
    confirm: 1,
    abort: 2
  }
end
