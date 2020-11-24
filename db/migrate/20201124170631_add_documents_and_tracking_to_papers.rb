class AddDocumentsAndTrackingToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :paper_document, :string
    add_column :papers, :active, :boolean, default: true

    add_column :papers, :created_by, :bigint
    add_index :papers, :created_by
    add_foreign_key :papers, :users, column: :created_by, primary_key: :id

    add_column :papers, :updated_by, :bigint
    add_index :papers, :updated_by
    add_foreign_key :papers, :users, column: :updated_by, primary_key: :id
  end
end
