# frozen_string_literal: true

module NotificationsHelper
  def name_finder(id)
    user = User.find(id)
    user.name
  end
end
