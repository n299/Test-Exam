# frozen_string_literal: true

class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  serialize :user_answers

  scope :list_user_exam, ->(user) { where(user: user, completed: true).order(score: :desc) }
  scope :create_user_exam, ->(exam_id, user) { where(exam_id: exam_id, user: user).first_or_create }
  scope :user_exams_completed, -> { where(completed: true) }

  def time_remaning
    created_at + 30.minutes - Time.now
  end
end
