# frozen_string_literal: true

class UserExamDecorator < Draper::Decorator
  delegate_all

  def exam_content
    exam.content
  end

  def user_success_exam
    user.decorate.full_name
  end
end
