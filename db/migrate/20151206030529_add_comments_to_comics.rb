class AddCommentsToComics < ActiveRecord::Migration
  def change
    add_column :comics, :comments, :string
  end
end
