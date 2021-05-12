class AddCategoryAndKsaToResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :research_creation_works, :category_id, :bigint
    add_index :research_creation_works, :category_id
    add_foreign_key :research_creation_works, :subtypes, column: :category_id, primary_key: :id

    add_reference :research_creation_works, :colciencias_call, foreign_key: true

    add_column :research_creation_works, :knwl_spec_area_id, :bigint
    add_index :research_creation_works, :knwl_spec_area_id
    add_foreign_key :research_creation_works, :subtypes, column: :knwl_spec_area_id, primary_key: :id
  end
end
