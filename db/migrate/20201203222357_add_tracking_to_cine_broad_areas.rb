class AddTrackingToCineBroadAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :cine_broad_areas, :active, :boolean

    add_column :cine_broad_areas, :created_by, :bigint
    add_index :cine_broad_areas, :created_by
    add_foreign_key :cine_broad_areas, :users, column: :created_by, primary_key: :id

    add_column :cine_broad_areas, :updated_by, :bigint
    add_index :cine_broad_areas, :updated_by
    add_foreign_key :cine_broad_areas, :users, column: :updated_by, primary_key: :id
  end
end
