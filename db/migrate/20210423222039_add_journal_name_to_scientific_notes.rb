class AddJournalNameToScientificNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :scientific_notes, :journal_name, :string
  end
end
