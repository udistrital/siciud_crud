class CreateCallDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :call_documents do |t|
      t.references :call, foreign_key: true
      t.bigint :document_id
      t.boolean :cd_required, default: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :call_documents, :document_id
    add_foreign_key :call_documents, :subtypes, column: :document_id, primary_key: :id

    add_index :call_documents, :created_by
    add_foreign_key :call_documents, :users, column: :created_by, primary_key: :id

    add_index :call_documents, :updated_by
    add_foreign_key :call_documents, :users, column: :updated_by, primary_key: :id
  end
end
