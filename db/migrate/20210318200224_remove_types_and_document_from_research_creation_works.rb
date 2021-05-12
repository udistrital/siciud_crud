class RemoveTypesAndDocumentFromResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :research_creation_works, :knwl_spec_area, foreign_key: true
    remove_reference :research_creation_works, :category, foreign_key: true
    remove_column :research_creation_works, :certificate_work_document, :string
  end
end
