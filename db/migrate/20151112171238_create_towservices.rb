class CreateTowservices < ActiveRecord::Migration
  def change
    create_table :towservices do |t|
      t.integer :price
      t.string :permalink
      t.boolean :completed, default: false
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
