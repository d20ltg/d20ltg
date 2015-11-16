class AddImageToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :image, :string
  end
end
