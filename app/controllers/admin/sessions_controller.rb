class Admin::SessionsController < ApplicationController
  
  def new
  end
  
  def create
    admin=Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      session[:admin_email]=admin.email
      redirect_to "/admins/items"
    else
      render :new
    end
  end
  
  def destroy
    session[:admin_email]=nil
    redirect_to new_admin_session_path
  end
  
end
