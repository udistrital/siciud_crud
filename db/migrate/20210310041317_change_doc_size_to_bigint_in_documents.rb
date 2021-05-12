class ChangeDocSizeToBigintInDocuments < ActiveRecord::Migration[5.2]
  def change
    change_column :documents, :doc_size, 'bigint USING CAST(doc_size AS bigint)'
    change_column_comment :documents, :doc_size, 'file size in bytes'
  end
end
