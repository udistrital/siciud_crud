class CreateCompleteDocuments < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_documents
  end
end
