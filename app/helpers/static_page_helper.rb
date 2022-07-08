module StaticPageHelper
  def friend_checker(uid)
    if (Friend.find_by_user_id(uid) == nil) and (Friend.find_by_friendid(uid) == nil)
      return true
    else
      return false
    end
  end

  def check_in_request(user)
    a = Notification.select("id").where(requestor:user.id, user_id:current_user.id,)
    b = Notification.select("id").where(requestor:current_user.id, user_id:user.id)
    if a != nil || b!= nil
      return false
    else 
      return true
    end
  end
end
