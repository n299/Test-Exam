# frozen_string_literal: true

module UserExamsHelper
  def users_exams_size
    UserExam.all.size
  end

  def check_answer_correct(answer, list_answer)
    if answer.correct?
      'text-success'
    elsif list_answer.present?
      'text-danger' if list_answer.include? answer.id.to_s
    end
  end
end
