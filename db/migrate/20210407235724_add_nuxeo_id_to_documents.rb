class AddNuxeoIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :nuxeo_id, :string
  end
end
