class Review < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank,
                                 allow_destroy: true

  scope :create_desc, ->{order created_at: :desc}
  scope :by_room_id, (lambda do |user_id, room_id|
    where(user_id: user_id, room_id: room_id)
  end)

  REVIEW_PARAMS = [:room_id, :content, :rating, {
    photos_attributes: [:id, :image, :_destroy]
  }].freeze

  validates :content, presence: true,
    length: {maximum: Settings.content.max_content}
end
