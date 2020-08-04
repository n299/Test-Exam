# frozen_string_literal: true

module Admins
  class UserExamsController < BaseController
    def index
      @user_exams = UserExam.all.decorate
    end
  end
end
