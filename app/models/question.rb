# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :reject_answers, allow_destroy: true
  belongs_to :exam
  # Validate
  validates :content, presence: true
  validates :point, presence: true
  validate :check_answers_number
  # Const
  ANSWER_COUNT_MIN = 2
  ANSWER_COUNT_CORRECT = 1

  private

  def reject_answers(attributes)
    attributes['text'].blank?
  end

  def answers_count_valid?
    answers.reject(&:marked_for_destruction?).count >= ANSWER_COUNT_MIN && list_answer.size == ANSWER_COUNT_CORRECT
  end

  def check_answers_number
    unless answers_count_valid?
      errors.add(:base, 'At least 2 answer')
    end
  end

  def list_answer
    answers.reject(&:marked_for_destruction?).select do |answer|
      answer.correct? == true
    end
  end
end
