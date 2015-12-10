class RemoveStockFromComics < ActiveRecord::Migration
  def change
    remove_column :comics, :stock, :integer
  end
end
