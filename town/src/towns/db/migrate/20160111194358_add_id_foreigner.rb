class AddIdForeigner < ActiveRecord::Migration
  def change
  	add_foreign_key :states, :countries
  	add_foreign_key :departments, :states
  	add_foreign_key :towns, :departments
  	
  end
end
