class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.text :users, array: true, default: []
      t.timestamps
    end
  end
end
