class AddSetAbbreviationToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :set_abbreviation, :string
  end
end
