class StaticController < ApplicationController
  def index
    if current_user
      redirect_to user_after_sign_in_path(current_user) and return
    end
  end
end
