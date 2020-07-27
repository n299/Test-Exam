# frozen_string_literal: true

class CreateUserExams < ActiveRecord::Migration[6.0]
  def change
    create_table :user_exams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
