class RemoveDocumentTypeFromDocuments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :documents, :document_type, foreign_key: true
  end
end
