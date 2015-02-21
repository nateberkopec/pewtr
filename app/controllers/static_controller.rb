class StaticController < ApplicationController
  skip_before_filter :check_user_logged_in!

  def index
    if current_user
      redirect_to user_after_sign_in_path(current_user) and return
    end
  end
end
