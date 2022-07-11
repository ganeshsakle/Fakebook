class Notification < ApplicationRecord
  belongs_to :user
  
  validates :user_id, uniqueness: true 

  paginates_per 10
end
