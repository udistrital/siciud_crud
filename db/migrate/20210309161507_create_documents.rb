class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :documentable, polymorphic: true
      t.string :doc_name
      t.string :doc_path
      t.string :doc_size
      t.bigint :document_type_id

      t.timestamps
    end

    add_index :documents, :document_type_id
    add_foreign_key :documents, :subtypes, column: :document_type_id, primary_key: :id

    add_column :documents, :active, :boolean, default: true

    add_column :documents, :created_by, :bigint
    add_index :documents, :created_by
    add_foreign_key :documents, :users, column: :created_by, primary_key: :id

    add_column :documents, :updated_by, :bigint
    add_index :documents, :updated_by
    add_foreign_key :documents, :users, column: :updated_by, primary_key: :id

    change_column_default :documents, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :documents, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_null :documents, :doc_name, false
    change_column_null :documents, :doc_path, false
  end
end
