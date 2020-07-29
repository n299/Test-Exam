# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]

  def edit; end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      flash[:notice] = 'Profile updated'
      redirect_to root_path
    else
      render action: 'edit'
    end
  end

  private
  def user_params
    update_attrs = %i[username avatar first_name last_name phone password password_confirmation]
    params.require(:user).permit(update_attrs)
  end
end
