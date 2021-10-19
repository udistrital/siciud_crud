class CreateFacultyIdsResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :faculty_ids_research_networks do |t|
      t.references :research_network, foreign_key: true
      t.bigint :faculty_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :faculty_ids_research_networks, :created_by
    add_foreign_key :faculty_ids_research_networks, :users, column: :created_by, primary_key: :id

    add_index :faculty_ids_research_networks, :updated_by
    add_foreign_key :faculty_ids_research_networks, :users, column: :updated_by, primary_key: :id
  end
end
