# frozen_string_literal: true

class UserExamsController < ApplicationController
  before_action :set_user, only: %i[show index exam_start]

  def create
    user_exam = UserExam.where(exam_id: params[:exam_id], user: current_user).first_or_create
    redirect_to exam_start_user_exam_url(user_exam)
  end

  def exam_start
    @exam_start = UserExam.find_by(id: params[:id])
    @time = @exam_start.time_remaning
    @exam = @exam_start.exam
  end

  def update
    score = total_exam_score
    user_exam = UserExam.find_by(id: params[:id])
    user_exam.update(score: score, user_answers: params[:list_answer], completed: true)
    render json: { status: true, score: score,  user_exam_path: user_exam_path(user_exam) }
  end

  def show
    @user_exam = UserExam.find_by(id: params[:id]).decorate
    return redirect_to(exams_url, alert: 'Your exam not exit') unless @user_exam.user == current_user
  end

  def index
    @user_exams = UserExam.list_user_exam(current_user)
  end

  private

  def set_user
    @user = current_user.decorate if user_signed_in?
  end

  def total_exam_score
    params[:list_answer].blank? ? 0 : Answer.total_score(params[:list_answer])
  end
end
