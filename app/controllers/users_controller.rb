# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_find, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy
  before_action :logged_in_user, except: %i[new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Добро пожаловать, #{@user.name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Профиль обновлен'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'Пользователь удален'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_find
    @user = User.find(params[:id])
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end