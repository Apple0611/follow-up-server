class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name
      t.text :summary
      t.text :overview

      t.timestamps null: false
    end
  end
end
