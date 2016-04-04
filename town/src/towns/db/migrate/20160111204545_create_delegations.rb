class CreateDelegations < ActiveRecord::Migration
  def change
    create_table :delegations do |t|
      t.integer :municipality_id
      t.integer :chief_id
      t.integer :address_id

      t.timestamps null: false
    end
    add_foreign_key :delegations, :people, column: :chief_id
    add_foreign_key :delegations, :addresses
    add_foreign_key :delegations, :municipalities
  end
end
