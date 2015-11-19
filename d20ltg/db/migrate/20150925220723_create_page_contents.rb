class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.string :title
      t.string :name
      t.string :body

      t.timestamps
    end
  end
end
