class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.integer :mayor_id
      t.integer :submayor_id
      t.integer :address_id

      t.timestamps null: false
    end
    add_foreign_key :municipalities, :addresses
    add_foreign_key :employees, :municipalities, column: :municipality_id
    add_foreign_key :municipalities, :people, column: :mayor_id
    add_foreign_key :municipalities, :people, column: :submayor_id
  end
end
