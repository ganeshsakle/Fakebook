# frozen_string_literal: true
module Users 
  class ConfirmationsController < Devise::ConfirmationsController

    def after_confirmation_path_for(_resource_name, resource)
      sign_in(resource) # In case you want to sign in the user
      root_path
    end
  end
end