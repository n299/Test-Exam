# frozen_string_literal: true

module Admins
  class UserExamsController < BaseController
    def index
      @user_exams = UserExam.user_exams_completed.decorate
    end

    def show
      @user_exam = UserExam.find_by(id: params[:id]).decorate
      return redirect_to(exams_url, alert: 'This exam not exit!') if @user_exam.blank?
    end
  end
end
