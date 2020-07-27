# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text :text
      t.boolean :correct

      t.timestamps
    end
  end
end
