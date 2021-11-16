class CreateJoinTableProposalsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    create_join_table :proposals, :research_groups do |t|
      # t.index [:proposal_id, :research_group_id]
      # t.index [:research_group_id, :proposal_id]
    end
  end
end
