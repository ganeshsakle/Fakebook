module FriendsHelper

    def friend_name_finder(user_id)
          a = User.find(user_id)
          return a.name
    end
end
