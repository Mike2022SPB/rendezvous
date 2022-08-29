class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show]

  before_action :set_current_user, except: %i[show]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('users.controller.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def set_current_user
    @user = current_user
  end
end
