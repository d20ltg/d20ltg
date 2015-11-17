class AddBlockIdToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :block_id, :integer
  end
end
