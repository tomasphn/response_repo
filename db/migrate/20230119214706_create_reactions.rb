class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.string :emotion
      t.references :response
      t.references :user
    end
  end
end
