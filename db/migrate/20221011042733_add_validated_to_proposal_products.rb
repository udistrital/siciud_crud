class AddValidatedToProposalProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :proposal_products, :validated, :boolean, default: false
  end
end
