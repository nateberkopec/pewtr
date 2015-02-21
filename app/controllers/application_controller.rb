class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_user_logged_in!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  include ApplicationHelper

  def check_user_logged_in!
    unless current_user
      session[:return_to] = request.original_url
      redirect_to root_url
    end
  end

  def record_not_found
    respond_to do |format|
      format.html do
        flash.now[:error] = "Sorry, we couldn't find what you're looking for."
        render "static/index", status: :not_found
      end
      format.json { head :not_found }
    end
  end

  def request_not_acceptable
    respond_to do |format|
      format.html do
        flash.now[:error] = "I'm sorry, I can't do that, Dave."
        render "static/index", status: :unprocessable_entity
      end
      format.json { head :unprocessable_entity }
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
