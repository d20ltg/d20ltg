class AddStoreHoursToStores < ActiveRecord::Migration
  def change
    add_column :stores, :store_hours, :string
  end
end
