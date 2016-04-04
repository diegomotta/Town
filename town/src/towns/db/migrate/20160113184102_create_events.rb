class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
  	    t.integer :parent_id
      	t.string :type
		t.string :name
		t.text :description
		t.date :start_date
		t.date :end_date
		t.integer :responsible_id
	    t.timestamps null: false
	    t.string :contact_number
	    t.string :email
	    t.integer :address_id
    end
  end
end
