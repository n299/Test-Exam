class AddContentToExams < ActiveRecord::Migration[6.0]
  def change
    add_column :exams, :content, :string
  end
end
