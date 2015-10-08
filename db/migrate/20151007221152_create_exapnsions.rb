class CreateExapnsions < ActiveRecord::Migration
  def change
    create_table :exapnsions do |t|
      t.string :set_name

      t.timestamps
    end
  end
end
