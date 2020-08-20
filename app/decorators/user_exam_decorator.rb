# frozen_string_literal: true

class UserExamDecorator < Draper::Decorator
  delegate_all

  def exam_content
    exam.content
  end

  def user_success_exam
    user.decorate.full_name
  end

  def exam_content
    exam.content
  end

  def exam_questions
    exam.questions
  end

  def exam_user
    exam
  end

  def check_user_exam(current_user)
    user == current_user && completed?
  end

  def total_score
    exam.decorate.total_score
  end
end
