class RemoveJournalFromPapers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :papers, :journal, foreign_key: true
  end
end
