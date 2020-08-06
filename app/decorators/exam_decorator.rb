# frozen_string_literal: true

class ExamDecorator < Draper::Decorator
  delegate_all

  def exam_category
    category.content
  end

  def exam_question_size
    questions.size
  end

  def check_exam_status
    status_draft? ? 'warning' : 'success'
  end

  def total_score
    questions.sum(:point)
  end
end
