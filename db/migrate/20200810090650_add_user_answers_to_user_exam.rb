# frozen_string_literal: true

class AddUserAnswersToUserExam < ActiveRecord::Migration[6.0]
  def change
    add_column :user_exams, :user_answers, :text
  end
end
