class CreateKnowledgeNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :knowledge_networks do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.string :funding_institution
      t.string :funding_community
      t.string :web_page
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :knowledge_networks, :category_id
    add_foreign_key :knowledge_networks, :subtypes, column: :category_id, primary_key: :id

    add_index :knowledge_networks, :created_by
    add_foreign_key :knowledge_networks, :users, column: :created_by, primary_key: :id

    add_index :knowledge_networks, :updated_by
    add_foreign_key :knowledge_networks, :users, column: :updated_by, primary_key: :id

  end
end
