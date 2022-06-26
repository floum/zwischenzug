class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    begin
    @user = User.find_by(name: params[:user][:name])
    rescue Mongoid::Errors::DocumentNotFound
    end

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash.notice = 'Welcome!'
    else
      flash.alert = 'Unrecognized login'
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
