class AddTrackingToPaperTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :paper_types, :active, :boolean, default: true

    add_column :paper_types, :created_by, :bigint
    add_index :paper_types, :created_by
    add_foreign_key :paper_types, :users, column: :created_by, primary_key: :id

    add_column :paper_types, :updated_by, :bigint
    add_index :paper_types, :updated_by
    add_foreign_key :paper_types, :users, column: :updated_by, primary_key: :id

    change_column_default :paper_types, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :paper_types, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
