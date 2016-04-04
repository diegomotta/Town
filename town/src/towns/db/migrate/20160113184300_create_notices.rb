class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
		t.integer :parent_id
		t.string :type
		t.date :start_date
		t.date :end_date
		t.integer :responsible_id
		t.string :email
		t.string :title
		t.string :description
		
      t.timestamps null: false
    end
  end
end
