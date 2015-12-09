class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :comic_name
      t.boolean :approved
      t.integer :user_id

      t.timestamps
    end
  end
end
