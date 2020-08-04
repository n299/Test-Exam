# frozen_string_literal: true

module UserExamsHelper
  def users_exams_size
    UserExam.all.size
  end
end
