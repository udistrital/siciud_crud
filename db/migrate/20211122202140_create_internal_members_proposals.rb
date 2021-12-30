class CreateInternalMembersProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_members_proposals do |t|
      t.references :proposal, foreign_key: true
      t.references :researcher, foreign_key: true
      t.references :role, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :internal_members_proposals, :created_by
    add_foreign_key :internal_members_proposals, :users, column: :created_by, primary_key: :id

    add_index :internal_members_proposals, :updated_by
    add_foreign_key :internal_members_proposals, :users, column: :updated_by, primary_key: :id
  end
end
