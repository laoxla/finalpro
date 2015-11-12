class CreateServiceProvides < ActiveRecord::Migration
  def change
    create_table :service_provides do |t|

      t.timestamps null: false
    end
  end
end
