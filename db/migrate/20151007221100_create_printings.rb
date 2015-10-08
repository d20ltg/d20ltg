class CreatePrintings < ActiveRecord::Migration
  def change
    create_table :printings do |t|
      t.integer :card_id
      t.integer :expansion_id
      t.integer :card_number

      t.timestamps
    end
  end
end
