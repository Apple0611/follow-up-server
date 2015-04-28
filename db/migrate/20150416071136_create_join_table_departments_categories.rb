class CreateJoinTableDepartmentsCategories < ActiveRecord::Migration
  def change
    create_join_table :departments, :categories do |t|
      # t.index [:department_id, :category_id]
      # t.index [:category_id, :department_id]
    end
  end
end
