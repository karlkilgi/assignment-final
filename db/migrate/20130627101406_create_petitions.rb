class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :target
      t.integer :vote

      t.timestamps
    end
  end
end
