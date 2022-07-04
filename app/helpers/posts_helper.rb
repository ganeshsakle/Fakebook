module PostsHelper
    def post_friend_checker(user, friends)
        friends.each do |f|
            if user == f.user_id || user == f.friendid
                return true
            end
        end
        return false
    end
end
