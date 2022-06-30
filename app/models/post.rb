class Post < ApplicationRecord
  acts_as_votable

  has_many_attached :image
  has_many :comments , dependent: :destroy
  belongs_to :user

  # default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                    message: "must be a valid image format" },
                    
                    size: { less_than: 5.megabytes,
                    message: "should be less than 5MB" }
  

end
