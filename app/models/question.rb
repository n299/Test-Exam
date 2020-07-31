# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :reject_answers
  belongs_to :exam
  validates :content, presence: true
  validates :point, presence: true

  private

  def reject_answers(attributes)
    attributes['text'].blank?
  end
end
