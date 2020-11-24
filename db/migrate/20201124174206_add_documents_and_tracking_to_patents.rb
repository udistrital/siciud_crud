class AddDocumentsAndTrackingToPatents < ActiveRecord::Migration[5.2]
  def change
    add_column :patents, :patent_certificate_document, :string
    add_column :patents, :active, :boolean, default: true

    add_column :patents, :created_by, :bigint
    add_index :patents, :created_by
    add_foreign_key :patents, :users, column: :created_by, primary_key: :id

    add_column :patents, :updated_by, :bigint
    add_index :patents, :updated_by
    add_foreign_key :patents, :users, column: :updated_by, primary_key: :id
  end
end
