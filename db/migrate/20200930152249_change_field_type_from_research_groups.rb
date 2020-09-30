class ChangeFieldTypeFromResearchGroups < ActiveRecord::Migration[5.2]
  def change
    change_column :research_groups, :cidc_act_number, :string
    change_column :research_groups, :faculty_act_number, :string
  end
end
