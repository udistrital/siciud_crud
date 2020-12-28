class AddDocumentsAndTrackingToScientificNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :scientific_notes, :approval_date, :date
    add_column :scientific_notes, :scientific_note_document, :string
    add_column :scientific_notes, :active, :boolean, default: true

    add_column :scientific_notes, :created_by, :bigint
    add_index :scientific_notes, :created_by
    add_foreign_key :scientific_notes, :users, column: :created_by, primary_key: :id

    add_column :scientific_notes, :updated_by, :bigint
    add_index :scientific_notes, :updated_by
    add_foreign_key :scientific_notes, :users, column: :updated_by, primary_key: :id
  end
end
