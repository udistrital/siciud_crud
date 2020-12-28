class RemoveJournalTitleFromScientificNotes < ActiveRecord::Migration[5.2]
  def change
    remove_column :scientific_notes, :journal_title, :string
  end
end
