class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.integer :year_founded
      t.integer :elevacion
      t.integer :populacion
      t.integer :latitude
      t.integer :longitude
      t.string :time_zone
      t.integer :cpa_base
      t.string :dialing_code

      t.timestamps null: false
    end
  end
end
