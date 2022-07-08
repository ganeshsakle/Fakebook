module NotificationsHelper

   def name_finder(id)
    user = User.find(id)
    return user.name
   end

end
