class AddExpansionIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :expansion_id, :integer
  end
end
