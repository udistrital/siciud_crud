class AddDocumentsAndTrackingToResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :research_creation_works, :certificate_work_document, :string
    add_column :research_creation_works, :active, :boolean, default: true

    add_column :research_creation_works, :created_by, :bigint
    add_index :research_creation_works, :created_by
    add_foreign_key :research_creation_works, :users, column: :created_by, primary_key: :id

    add_column :research_creation_works, :updated_by, :bigint
    add_index :research_creation_works, :updated_by
    add_foreign_key :research_creation_works, :users, column: :updated_by, primary_key: :id
  end
end
