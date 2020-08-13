# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :set_user, only: :index

  def index; end

  private

  def set_user
    @user = current_user.decorate if user_signed_in?
  end
end
