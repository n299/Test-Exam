# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :exam, null: false, foreign_key: true
      t.text :content
      t.integer :point

      t.timestamps
    end
  end
end
