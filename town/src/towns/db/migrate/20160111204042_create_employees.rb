class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :municipality_id
      t.integer :person_id
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
    add_foreign_key :employees, :people, column: :person_id


  end
end
