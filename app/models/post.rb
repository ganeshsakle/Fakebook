class Post < ApplicationRecord

  
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :comments , dependent: :destroy
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
  #                   message: "must be a valid image format" },
                    
  #                   size: { less_than: 5.megabytes,
  #                   message: "should be less than 5MB" }
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  

end
