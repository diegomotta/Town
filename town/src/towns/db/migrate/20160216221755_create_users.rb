class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :person_id
      t.string :username
      t.string :password
      t.string :email
      t.date :last_signin
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
