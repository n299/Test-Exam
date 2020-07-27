# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :user_exams

  enum status: %i[draft public], _prefix: true
end
