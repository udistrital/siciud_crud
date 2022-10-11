class CreateJoinTableProposalProductResearcher < ActiveRecord::Migration[5.2]
  def change
    create_join_table :proposal_products, :researchers do |t|
      # t.index [:proposal_product_id, :researcher_id]
      # t.index [:researcher_id, :proposal_product_id]
    end
  end
end
