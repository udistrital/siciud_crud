class AddTrackingToOecdKnowledgeAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :oecd_knowledge_areas, :active, :boolean, default: true

    add_column :oecd_knowledge_areas, :created_by, :bigint
    add_index :oecd_knowledge_areas, :created_by
    add_foreign_key :oecd_knowledge_areas, :users, column: :created_by, primary_key: :id

    add_column :oecd_knowledge_areas, :updated_by, :bigint
    add_index :oecd_knowledge_areas, :updated_by
    add_foreign_key :oecd_knowledge_areas, :users, column: :updated_by, primary_key: :id
  end
end
