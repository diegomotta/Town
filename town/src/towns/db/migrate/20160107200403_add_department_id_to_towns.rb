class AddDepartmentIdToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :department_id, :integer
  end
end
