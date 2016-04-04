class AddTownIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :town_id, :integer
    add_foreign_key :people, :towns
  end
end
