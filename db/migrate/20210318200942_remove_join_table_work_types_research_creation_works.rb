class RemoveJoinTableWorkTypesResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :research_creation_works, :work_types
  end
end
