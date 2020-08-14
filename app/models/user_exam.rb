# frozen_string_literal: true

class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  serialize :user_answers

  scope :list_user_exam, ->(user){ where(user: user) }

  def time_remaning
    created_at + 30.minutes - Time.now
  end
end
