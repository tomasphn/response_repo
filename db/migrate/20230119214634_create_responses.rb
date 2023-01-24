class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :text
      t.references :prompt
      t.references :user
    end
  end
end
