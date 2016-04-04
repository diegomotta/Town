class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :line_1
      t.text :line_2
      t.integer :latitude
      t.integer :longitude

      t.timestamps null: false
    end
  end
end
