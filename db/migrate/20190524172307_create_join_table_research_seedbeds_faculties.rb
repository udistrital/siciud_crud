class CreateJoinTableResearchSeedbedsFaculties < ActiveRecord::Migration[5.2]
  def change
    create_join_table :research_seedbeds, :faculties do |t|
      # t.index [:research_seedbed_id, :faculty_id]
      # t.index [:faculty_id, :research_seedbed_id]
    end
  end
end
