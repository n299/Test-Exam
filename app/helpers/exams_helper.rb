# frozen_string_literal: true

module ExamsHelper
  def exams_size
    Exam.all.size
  end

  def answer_correct(answer)
    'list-group-item-success' if answer.correct?
  end
end
