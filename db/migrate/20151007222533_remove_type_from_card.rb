class RemoveTypeFromCard < ActiveRecord::Migration
  def change
    remove_column :cards, :type
  end
end
