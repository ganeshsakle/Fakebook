module StaticPageHelper

    def user_checker(user)
        z = user.notifications.all
        if z.size>0
            return false
        else
            return true
        end
    end

    def friend_checker(user,friends)
        friends.each do |f|
            if user.id == f.user_id || user.id == f.friendid
                return false
            end
        end
        return true
    end
end
