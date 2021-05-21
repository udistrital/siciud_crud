class AddNatureFromSubtypesToResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :research_creation_works, :nature_id, :bigint
    add_index :research_creation_works, :nature_id
    add_foreign_key :research_creation_works, :subtypes, column: :nature_id, primary_key: :id
  end
end
