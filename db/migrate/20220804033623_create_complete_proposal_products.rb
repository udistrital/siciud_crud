class CreateCompleteProposalProducts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_proposal_products
  end
end
