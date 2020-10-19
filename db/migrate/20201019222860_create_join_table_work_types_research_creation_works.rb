class CreateJoinTableWorkTypesResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :work_types, :research_creation_works do |t|
      # t.index [:work_type_id, :research_creation_work_id]
      # t.index [:research_creation_work_id, :work_type_id]
    end
  end
end
