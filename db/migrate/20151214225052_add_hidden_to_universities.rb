class AddHiddenToUniversities < ActiveRecord::Migration
  def change
    add_column :universes, :hidden, :boolean, :default => true
  end
end
