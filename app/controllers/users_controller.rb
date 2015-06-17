class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit]

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:user_name, :email, :password,
                                                :password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully logged in"
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    user_params = params.require(:user).permit(:user_name, :email, :password,
                                                :password_confirmation)
    @user = current_user
    if !@user.authenticate(params[:current_password])
      flash[:alert] = "You've entered the incorrect password"
      render :edit
    elsif @user.update user_params
      redirect_to root_path, notice: "Successfully updated profile"
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end
  end
end
