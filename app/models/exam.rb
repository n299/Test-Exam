# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :reject_questions, allow_destroy: true
  has_many :user_exams
  # Validate
  validates :content, presence: true

  enum status: %i[draft public], _prefix: true

  private

  def reject_questions(attributes)
    attributes['content'].blank? || attributes['point'].blank?
  end
end
