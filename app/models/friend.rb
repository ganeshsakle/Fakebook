class Friend < ApplicationRecord
  belongs_to :user
  #validates :user_id, :friend_id, uniqueness: true
end
