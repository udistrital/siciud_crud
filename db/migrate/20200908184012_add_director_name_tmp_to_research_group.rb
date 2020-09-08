class AddDirectorNameTmpToResearchGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :research_groups, :director_name_tmp, :string
  end
end
