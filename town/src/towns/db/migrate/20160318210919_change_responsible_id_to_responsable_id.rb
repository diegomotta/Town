class ChangeResponsibleIdToResponsableId < ActiveRecord::Migration
  def change
  	rename_column :notices, :responsible_id, :responsable_id
  end
end
