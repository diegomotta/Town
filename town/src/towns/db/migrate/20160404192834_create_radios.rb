class CreateRadios < ActiveRecord::Migration
  def change
    create_table :radios do |t|
      t.string :name
      t.integer :owner_id
      t.integer :address_id
      t.integer :telefone
      t.string :email

      t.timestamps null: false
    end
    
    add_foreign_key :radios, :addresses
    add_foreign_key :radios, :people, column: :owner_id
        
  end
end
