class CreateResearchGroupsResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :research_groups_research_networks do |t|
      t.references :research_group, foreign_key: true
      t.references :research_network, foreign_key: true
      t.boolean :has_expiration, default: false
      t.date :expiration_date
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :research_groups_research_networks, :created_by
    add_foreign_key :research_groups_research_networks, :users, column: :created_by, primary_key: :id

    add_index :research_groups_research_networks, :updated_by
    add_foreign_key :research_groups_research_networks, :users, column: :updated_by, primary_key: :id

  end
end
