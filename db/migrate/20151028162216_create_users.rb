class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :vechicle_type
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
