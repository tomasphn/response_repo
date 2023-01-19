class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :response_text, limit: 500
      t.string :prompt_text, limit: 500
      t.integer :like, default: 0
      t.integer :love, default: 0
      t.integer :haha, default: 0
      t.integer :wow, default: 0
      t.integer :sad, default: 0
      t.integer :angry, default: 0
      t.timestamps
    end
  end
end
