class AddTrackingToCineSpecificAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :cine_specific_areas, :active, :boolean

    add_column :cine_specific_areas, :created_by, :bigint
    add_index :cine_specific_areas, :created_by
    add_foreign_key :cine_specific_areas, :users, column: :created_by, primary_key: :id

    add_column :cine_specific_areas, :updated_by, :bigint
    add_index :cine_specific_areas, :updated_by
    add_foreign_key :cine_specific_areas, :users, column: :updated_by, primary_key: :id
  end
end
