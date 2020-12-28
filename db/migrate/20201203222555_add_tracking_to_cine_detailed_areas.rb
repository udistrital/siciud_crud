class AddTrackingToCineDetailedAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :cine_detailed_areas, :active, :boolean, default: true
    
    add_column :cine_detailed_areas, :created_by, :bigint
    add_index :cine_detailed_areas, :created_by
    add_foreign_key :cine_detailed_areas, :users, column: :created_by, primary_key: :id

    add_column :cine_detailed_areas, :updated_by, :bigint
    add_index :cine_detailed_areas, :updated_by
    add_foreign_key :cine_detailed_areas, :users, column: :updated_by, primary_key: :id
  end
end