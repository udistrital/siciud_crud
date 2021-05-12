class CreateJoinTableSubtypesResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_creation_works, :subtypes, table_name: :research_creation_works_work_types do |t|
      # t.index [:research_creation_work_id, :subtype_id]
      # t.index [:subtype_id, :research_creation_work_id]
    end
  end
end
