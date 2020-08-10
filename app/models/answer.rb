# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  validates :text, presence: true
  scope :answers_correct, ->(answer_id) { where(id: answer_id, correct: true) }

  def self.total_score(params)
    answers_correct(params).sum { |answer| answer.question.point }
  end
end
