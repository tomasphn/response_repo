# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :email
    rename_column :users, :password, :encrypted_password
    change_column_null :users, :email, false
    change_column_default :users, :email, ""

    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

    add_timestamps :users, null: false
  end
end
