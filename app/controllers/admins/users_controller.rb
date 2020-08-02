# frozen_string_literal: true

module Admins
  class UsersController < BaseController
    before_action :set_user, only: %i[edit update destroy]

    def index
      @users = SearchService.new(params).perform.decorate
    end

    def new
      @user = User.new
    end

    def edit; end

    def create
      @user = User.new user_params
      if @user.save
        redirect_to admins_users_path
      else
        render :new
      end
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to admins_users_path
      else
        render :edit
      end
    end

    def destroy
      return redirect_to admins_users_path if @user.destroy
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find_by(id: params[:id])
      return redirect_to(admins_users_url, alert: 'User not exit') if @user.blank?
    end
  end
end
