class CreateSubtypes < ActiveRecord::Migration[5.2]
  def change
    create_table :subtypes do |t|
      t.string :st_name
      t.text :st_description
      t.bigint :parent_id
      t.references :type, foreign_key: true

      t.timestamps
    end
    add_index :subtypes, :parent_id
    add_foreign_key :subtypes, :subtypes, column: :parent_id, primary_key: :id

    add_column :subtypes, :active, :boolean, default: true

    add_column :subtypes, :created_by, :bigint
    add_index :subtypes, :created_by
    add_foreign_key :subtypes, :users, column: :created_by, primary_key: :id

    add_column :subtypes, :updated_by, :bigint
    add_index :subtypes, :updated_by
    add_foreign_key :subtypes, :users, column: :updated_by, primary_key: :id

    change_column_default :subtypes, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :subtypes, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
