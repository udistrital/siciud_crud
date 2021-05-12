class AddJournalNameToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :journal_name, :string
  end
end
