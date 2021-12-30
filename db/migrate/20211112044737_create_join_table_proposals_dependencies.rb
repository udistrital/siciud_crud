class CreateJoinTableProposalsDependencies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :proposals, :dependencies do |t|
      # t.index [:proposal_id, :dependency_id]
      # t.index [:dependency_id, :proposal_id]
    end
  end
end
