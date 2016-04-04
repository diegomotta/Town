class AddSubdomainToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :subdomain, :string
  end
end
