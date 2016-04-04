class AddElevationToTowns < ActiveRecord::Migration

def up
    rename_column :towns, :elevacion, :elevation
    rename_column :towns, :populacion, :population
end
end