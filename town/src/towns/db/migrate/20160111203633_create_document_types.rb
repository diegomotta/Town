class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :document_types do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :people, :document_types
  end
end
