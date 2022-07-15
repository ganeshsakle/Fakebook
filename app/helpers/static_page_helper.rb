# frozen_string_literal: true

module StaticPageHelper
  def friend_checker(uid)
    if Friend.find_by_user_id(uid).nil? && Friend.find_by_friend_id(uid).nil?
      true
    else
      false
    end
  end

  def check_in_request(user)
    a = Notification.select('id').where(requestor_id: user.id, user_id: current_user.id)
    b = Notification.select('id').where(requestor_id: current_user.id, user_id: user.id)
    if !a.nil? || !b.nil?
      false
    else
      true
    end
  end
end
