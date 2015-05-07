class AddColumnsToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases, :name_en, :string
    add_column :diseases, :en_abbr, :string
    add_column :diseases, :name_py, :string
    add_column :diseases, :py_abbr, :string
  end
end
