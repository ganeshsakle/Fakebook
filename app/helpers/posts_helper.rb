# frozen_string_literal: true

module PostsHelper
  def post_friend_checker(user, friends)
    friends.each do |f|
      return true if user == f.user_id || user == f.friend_id
    end
    false
  end
end
