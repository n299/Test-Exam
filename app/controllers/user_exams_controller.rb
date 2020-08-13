# frozen_string_literal: true

class UserExamsController < ApplicationController
  def create
    score = total_exam_score
    exam = Exam.find_by(id: params[:exam_id])
    user_exam = UserExam.new(user: current_user, exam: exam, score: score, user_answers: params[:list_answer])
    render json: { status: true, score: score,  user_exam_path: user_exam_path(user_exam) } if user_exam.save
  end

  def show
    @user_exam = UserExam.find_by(id: params[:id]).decorate
    @user = current_user.decorate if user_signed_in?
    return redirect_to(exams_url, alert: 'Your exam not exit') unless @user_exam.user == current_user
  end

  private

  def total_exam_score
    params[:list_answer].blank? ? 0 : Answer.total_score(params[:list_answer])
  end
end
