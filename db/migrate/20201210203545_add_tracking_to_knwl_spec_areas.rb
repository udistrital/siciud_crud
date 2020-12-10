class AddTrackingToKnwlSpecAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :knwl_spec_areas, :active, :boolean, default: true

    add_column :knwl_spec_areas, :created_by, :bigint
    add_index :knwl_spec_areas, :created_by
    add_foreign_key :knwl_spec_areas, :users, column: :created_by, primary_key: :id

    add_column :knwl_spec_areas, :updated_by, :bigint
    add_index :knwl_spec_areas, :updated_by
    add_foreign_key :knwl_spec_areas, :users, column: :updated_by, primary_key: :id

    change_column_default :knwl_spec_areas, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :knwl_spec_areas, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
