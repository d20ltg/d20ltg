class AddUniverseIdToComics < ActiveRecord::Migration
  def change
    add_column :comics, :universe_id, :integer
  end
end
