class AddHiddenToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :hidden, :boolean, :default => false
  end
end
