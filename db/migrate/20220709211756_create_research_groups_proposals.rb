class CreateResearchGroupsProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :research_groups_proposals do |t|
      t.references :research_group, foreign_key: true
      t.references :proposal, foreign_key: true
      t.bigint :role_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :research_groups_proposals, :role_id
    add_foreign_key :research_groups_proposals, :users, column: :role_id, primary_key: :id

    add_index :research_groups_proposals, :created_by
    add_foreign_key :research_groups_proposals, :users, column: :created_by, primary_key: :id

    add_index :research_groups_proposals, :updated_by
    add_foreign_key :research_groups_proposals, :users, column: :updated_by, primary_key: :id
  end
end
