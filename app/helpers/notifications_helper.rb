module NotificationsHelper

   def name_finder(id)
    @name = @users.find(id)
    return @name.name
   end

end
