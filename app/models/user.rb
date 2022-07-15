class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  paginates_per 10

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data['email']).first
  end
end
