class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :title
      t.string :description
      t.date :event_day

      t.timestamps
    end
  end
end
