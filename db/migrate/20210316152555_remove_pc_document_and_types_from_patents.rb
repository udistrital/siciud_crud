class RemovePcDocumentAndTypesFromPatents < ActiveRecord::Migration[5.2]
  def change
    remove_column :patents, :patent_certificate_document, :string
    remove_reference :patents, :category, foreign_key: true
    remove_reference :patents, :patent_state, foreign_key: true
  end
end
