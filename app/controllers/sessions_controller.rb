class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    user = User.from_omniauth(ActionController::Parameters.new(env['omniauth.auth']).permit!)
    user.save!
    session[:user_id] = user.id
    redirect_to user_after_sign_in_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
