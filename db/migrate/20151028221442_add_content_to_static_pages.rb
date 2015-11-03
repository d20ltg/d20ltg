class AddContentToStaticPages < ActiveRecord::Migration
  def change
    add_column :static_pages, :content, :string
  end
end
