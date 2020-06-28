class CreateCallsRequiredDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :calls_required_documents do |t|
      t.boolean :required
      t.references :call, foreign_key: true
      t.references :required_document, foreign_key: true

      t.timestamps
    end
  end
end
