class AddStockToGames < ActiveRecord::Migration
  def change
    add_column :games, :stock, :integer, :default => 0
  end
end
