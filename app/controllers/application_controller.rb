class ApplicationController < ActionController::Base
  def require_login!
  if session[:user_mail].nil?
    redirect_to new_admin_session_path
  end
  end
end
