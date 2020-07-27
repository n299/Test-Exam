# frozen_string_literal: true

class AddFieldToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :username, :string
  end
end
