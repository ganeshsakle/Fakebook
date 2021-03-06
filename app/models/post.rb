# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
