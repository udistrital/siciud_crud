class CreateJoinTableResearchFocusesProposals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subtypes, :proposals, table_name: :research_focuses_proposals do |t|
      # t.index [:subtype_id, :proposal_id]
      # t.index [:proposal_id, :subtype_id]
    end
  end
end
