class AddMarketTypeIdToSupermarkets < ActiveRecord::Migration
  def change
    add_column :supermarkets, :market_type_id, :integer
    add_foreign_key :supermarkets, :market_types
  end
end
