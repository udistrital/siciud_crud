class RemovePaperTypeAndCategoryFromPapers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :papers, :category, foreign_key: true
    remove_reference :papers, :paper_type, foreign_key: true
  end
end
