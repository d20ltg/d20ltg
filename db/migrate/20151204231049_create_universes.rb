class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :universe_name

      t.timestamps
    end
  end
end
