class CreateImpacts < ActiveRecord::Migration[5.2]
  def change
    create_table :impacts do |t|
      t.bigint :impact_type_id
      t.references :indicator, foreign_key: true
      t.text :description
      t.string :goal
      t.bigint :term_id
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :impacts, :impact_type_id
    add_foreign_key :impacts, :subtypes, column: :impact_type_id, primary_key: :id

    add_index :impacts, :term_id
    add_foreign_key :impacts, :subtypes, column: :term_id, primary_key: :id

    add_index :impacts, :created_by
    add_foreign_key :impacts, :users, column: :created_by, primary_key: :id

    add_index :impacts, :updated_by
    add_foreign_key :impacts, :users, column: :updated_by, primary_key: :id
  end
end
