class AddConditionToComics < ActiveRecord::Migration
  def change
    add_column :comics, :condition, :integer
  end
end
