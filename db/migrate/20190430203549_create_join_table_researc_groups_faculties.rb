class CreateJoinTableResearcGroupsFaculties < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_groups, :faculties do |t|
      # t.index [:research_group_id, :faculty_id]
      # t.index [:faculty_id, :research_group_id]
    end
  end
end
