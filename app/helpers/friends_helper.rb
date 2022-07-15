# frozen_string_literal: true

module FriendsHelper
  def friend_name_finder(user_id)
    a = User.find(user_id)
    a.name
  end
end
