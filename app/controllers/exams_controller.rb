# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @exams = Exam.status_public.decorate
  end

  private

  def set_user
    @user = current_user.decorate
  end
end
