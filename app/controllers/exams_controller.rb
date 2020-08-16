# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :set_user, only: %i[index]

  def index
    @exams = Exam.list_exam(Exam.check_exam(current_user)).decorate
  end

  private

  def set_user
    @user = current_user.decorate if user_signed_in?
  end
end
