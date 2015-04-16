class CreateJoinTableDepartmentsDiseaseCategories < ActiveRecord::Migration
  def change
    create_join_table :departments, :disease_categories do |t|
      # t.index [:department_id, :disease_category_id]
      # t.index [:disease_category_id, :department_id]
    end
  end
end
