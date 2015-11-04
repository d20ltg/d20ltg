class RenameExapnsionsToExpansions < ActiveRecord::Migration
  def change
    rename_table :exapnsions, :expansions
  end
end
