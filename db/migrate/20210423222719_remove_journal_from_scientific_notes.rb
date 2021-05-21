class RemoveJournalFromScientificNotes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :scientific_notes, :journal, foreign_key: true
  end
end
