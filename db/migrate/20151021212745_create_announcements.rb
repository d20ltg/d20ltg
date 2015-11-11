class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :image
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
