class CreateJoinTableResearchGroupsAgreements < ActiveRecord::Migration[5.2]
  def change
    create_join_table :agreements, :research_groups do |t|
      # t.index [:agreement_id, :research_group_id]
      # t.index [:research_group_id, :agreement_id]
    end
  end
end
