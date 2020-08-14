# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @exams = Exam.check_exam(current_user)
  end

  private

  def set_user
    @user = current_user.decorate if user_signed_in?
  end
end
