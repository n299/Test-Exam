# frozen_string_literal: true

class AddFieldToUserExams < ActiveRecord::Migration[6.0]
  def change
    add_column :user_exams, :completed, :boolean
  end
end
