class AddTrackingToColcienciasCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :colciencias_categories, :active, :boolean, default: true

    add_column :colciencias_categories, :created_by, :bigint
    add_index :colciencias_categories, :created_by
    add_foreign_key :colciencias_categories, :users, column: :created_by, primary_key: :id

    add_column :colciencias_categories, :updated_by, :bigint
    add_index :colciencias_categories, :updated_by
    add_foreign_key :colciencias_categories, :users, column: :updated_by, primary_key: :id
  end
end
