class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.date :date
      t.string :note
      t.timestamps
    end
  end
end
