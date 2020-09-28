class RemoveFieldsFromResearcherGroup < ActiveRecord::Migration[5.2]
  def change
    remove_index :research_groups, :snies_id
    remove_column :research_groups, :snies_id

    remove_column :research_groups, :director_name_tmp, :string
  end
end
