class CreateOecdKnowledgeSubareas < ActiveRecord::Migration[5.2]
  def change
    create_table :oecd_knowledge_subareas do |t|
      t.string :name
      t.string :code
      t.references :oecd_knowledge_area, foreign_key: true

      t.timestamps
    end
  end
end
