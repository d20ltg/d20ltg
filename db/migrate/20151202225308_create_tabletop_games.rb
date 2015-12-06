class CreateTabletopGames < ActiveRecord::Migration
  def change
    create_table :tabletop_games do |t|
      t.string :set_name
      t.string :image

      t.timestamps
    end
  end
end
