class RemoveNatureOfWorkFromResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :research_creation_works, :nature_of_work, :string
  end
end
