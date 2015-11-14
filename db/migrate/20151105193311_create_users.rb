class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.boolean :admin

      t.timestamps
    end
  end
end
