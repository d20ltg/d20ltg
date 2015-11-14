class CreateRecurringEvents < ActiveRecord::Migration
  def change
    create_table :recurring_events do |t|
      t.string :title
      t.text :description
      t.integer :day
      t.string :event_time
      t.string :event_type

      t.timestamps
    end
  end
end
