class AddTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :event_time, :string
  end
end
