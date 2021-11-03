class CreateCompleteCallDocuments < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_call_documents
  end
end
