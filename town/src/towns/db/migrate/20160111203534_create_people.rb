class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.integer :document_type_id
      t.string :document_number
      t.integer :job_address_id
      t.date :birth_date
      t.integer :home_address_id

      t.timestamps null: false
    end
    add_foreign_key :people, :addresses, column: :job_address_id
    add_foreign_key :people, :addresses, column: :home_address_id
    
  end
end
