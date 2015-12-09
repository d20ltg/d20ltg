class AddImageToUniverses < ActiveRecord::Migration
  def change
    add_column :universes, :image, :string
  end
end
