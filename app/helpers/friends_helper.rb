module FriendsHelper

    def friend_name_finder(user_id)
        if user_id != current_user.id
          a = User.find(user_id)
          return a.name
        end
    end
end
