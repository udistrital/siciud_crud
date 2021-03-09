class AddTypeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :type_id, :bigint
    add_index :documents, :type_id
    add_foreign_key :documents, :subtypes, column: :type_id, primary_key: :id

    change_column_default :documents, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :documents, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
