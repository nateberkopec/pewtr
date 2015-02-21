class Users::SetupsController < ApplicationController
  check_authorization

  def new
    @user = User.find(params[:user_id])
    authorize! :update, @user
  end
end
