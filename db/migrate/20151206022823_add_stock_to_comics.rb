class AddStockToComics < ActiveRecord::Migration
  def change
    add_column :comics, :stock, :integer
  end
end
