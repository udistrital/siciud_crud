class AddDocumentsToResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :cidc_act_document, :string
    add_column :research_groups, :establishment_document, :string
    add_column :research_groups, :faculty_act_document, :string
  # add as many columns as you need
  end
end
