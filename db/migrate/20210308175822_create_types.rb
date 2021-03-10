class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :t_name
      t.text :t_description

      t.timestamps
    end

    add_column :types, :active, :boolean, default: true

    add_column :types, :created_by, :bigint
    add_index :types, :created_by
    add_foreign_key :types, :users, column: :created_by, primary_key: :id

    add_column :types, :updated_by, :bigint
    add_index :types, :updated_by
    add_foreign_key :types, :users, column: :updated_by, primary_key: :id

    change_column_default :types, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :types, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
