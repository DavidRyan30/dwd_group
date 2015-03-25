class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :quantity
      t.string :name
      t.string :list_id
      t.timestamps
    end
  end
end
