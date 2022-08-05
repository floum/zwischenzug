class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = @current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'user successfully added'
      session[:user_id] = @user.id
    else
      flash.alert = @user.errors.full_messages
    end
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save

    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :language)
  end
end
