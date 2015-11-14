class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :tax, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
