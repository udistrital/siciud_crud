class CreateJoinTableProposalsEntities < ActiveRecord::Migration[5.2]
  def change
    create_join_table :proposals, :entities do |t|
      # t.index [:proposal_id, :entity_id]
      # t.index [:entity_id, :proposal_id]
    end
  end
end
