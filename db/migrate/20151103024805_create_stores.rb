class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_address
      t.string :store_phone
      t.string :store_email
      t.string :store_description

      t.timestamps
    end
  end
end
