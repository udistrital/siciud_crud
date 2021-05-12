class RemoveTypesAndDocumentsFromResearchGroups < ActiveRecord::Migration[5.2]
  def change
    remove_reference :research_groups, :group_type, foreign_key: true
    remove_reference :research_groups, :group_state, foreign_key: true
    remove_column :research_groups, :cidc_act_document, :string
    remove_column :research_groups, :establishment_document, :string
    remove_column :research_groups, :faculty_act_document, :string
  end
end
