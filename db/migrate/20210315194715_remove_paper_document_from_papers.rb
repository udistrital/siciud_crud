class RemovePaperDocumentFromPapers < ActiveRecord::Migration[5.2]
  def change
    remove_column :papers, :paper_document, :string
  end
end
