class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to root_path
        flash[:success] = "Welcome back to EduScore #{user.name}!"
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end

  def destroy
      sign_out
      redirect_to root_path
      flash[:success] = "Thanks for visiting! You are now signed out."
  end
end
