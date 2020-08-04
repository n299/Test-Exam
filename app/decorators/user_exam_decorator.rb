# frozen_string_literal: true

class UserExamDecorator < Draper::Decorator
  delegate_all

  def create_time
    created_at.strftime('%d/%m/%Y %H:%M')
  end

  def exam_content
    exam.content
  end

  def user_success_exam
    user.decorate.full_name
  end
end
