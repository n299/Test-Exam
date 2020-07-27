# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.integer :status
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
