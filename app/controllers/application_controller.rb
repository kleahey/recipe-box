class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  def after_sign_in_path_for(user)
   user_recipes_path(current_user.user_name)
  end
end
