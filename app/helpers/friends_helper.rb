# frozen_string_literal: true

  def friend_name_finder(id)
    a = User.find(id)
    a.name
  end