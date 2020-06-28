class CreateRequiredDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :required_documents do |t|
      t.string :document_name

      t.timestamps
    end
  end
end
