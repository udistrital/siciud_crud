class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.integer :duration, limit: 1
      t.bigint :proposal_status_id
      t.bigint :project_type_id
      t.references :call, foreign_key: true
      t.references :geo_city, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :proposals, :proposal_status_id
    add_foreign_key :proposals, :subtypes, column: :proposal_status_id, primary_key: :id

    add_index :proposals, :project_type_id
    add_foreign_key :proposals, :subtypes, column: :project_type_id, primary_key: :id

    add_index :proposals, :created_by
    add_foreign_key :proposals, :users, column: :created_by, primary_key: :id

    add_index :proposals, :updated_by
    add_foreign_key :proposals, :users, column: :updated_by, primary_key: :id
    
  end
end
