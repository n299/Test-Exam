# frozen_string_literal: true

class ExamsController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    @exams = Exam.status_public.decorate
  end

  def show
    @exam = Exam.find_by(id: params[:id])
    return redirect_to(exams_url, alert: 'Exam not exit') if @exam.blank? || @exam.status_draft?
  end

  private

  def set_user
    @user = current_user.decorate
  end
end
