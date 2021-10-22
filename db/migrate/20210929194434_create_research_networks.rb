class CreateResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :research_networks do |t|
      t.string :name
      t.string :acronym
      t.date :request_date
      t.text :mission
      t.text :vision
      t.text :advantage
      t.references :researcher, foreign_key: true
      t.bigint :main_research_group_id
      t.bigint :network_type_id
      t.references :cine_broad_area, foreign_key: true
      t.references :cine_specific_area, foreign_key: true
      t.references :oecd_knowledge_subarea, foreign_key: true
      t.references :oecd_knowledge_area, foreign_key: true
      t.text :academic_responsibilities
      t.text :financial_responsibilities
      t.text :legal_responsibilities
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :research_networks, :main_research_group_id
    add_foreign_key :research_networks, :research_groups, column: :main_research_group_id, primary_key: :id

    add_index :research_networks, :network_type_id
    add_foreign_key :research_networks, :subtypes, column: :network_type_id, primary_key: :id

    add_index :research_networks, :created_by
    add_foreign_key :research_networks, :users, column: :created_by, primary_key: :id

    add_index :research_networks, :updated_by
    add_foreign_key :research_networks, :users, column: :updated_by, primary_key: :id
  end
end
