class CreateExpansions < ActiveRecord::Migration
  def change
    create_table :expansions do |t|
      t.string :set_name

      t.timestamps
    end
  end
end
