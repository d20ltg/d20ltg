class RemoveStockFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :stock, :integer
  end
end
