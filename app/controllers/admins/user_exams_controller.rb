# frozen_string_literal: true

module Admins
  class UserExamsController < BaseController
    def index
      @user_exams = UserExam.user_exams_completed.decorate
    end
  end
end
