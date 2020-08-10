# frozen_string_literal: true

class UserExamsController < ApplicationController
  def create
    score = total_score
    exam = Exam.find_by(params[:exam_id])
    userexam = UserExam.new(user: current_user, exam: exam, score: score)
    render json: { status: true, score: score } if userexam.save
  end

  private

  def total_score
    params[:list_answer].blank? ? 0 : Answer.total_score(params[:list_answer])
  end
end
