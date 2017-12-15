class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Thanks, new account created successfully!"
      redirect_to '/'
    else
      flash[:notice] = "Something went wrong while setting up your account."
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
