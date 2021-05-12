class RemoveSnDocumentAndCategoryFromScientificNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :scientific_notes, :scientific_note_document, :string
    remove_reference :scientific_notes, :category, foreign_key: true
  end
end
