class AddStockToCards < ActiveRecord::Migration
  def change
    add_column :cards, :stock, :integer, :default => 0
  end
end
