module ApplicationHelper
  def user_after_sign_in_path(user)
    if user.setup?
      session.delete(:return_to) || root_url
    else
      new_user_setup_path(user)
    end
  end
end
