# frozen_string_literal: true

class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam
end
