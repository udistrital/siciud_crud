class AddContributionFundingEntityItemsToContributionRpItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :contribution_rp_items, :contribution_funding_entity_item,
    index:{
    name: 'index_contribution_rp_items_on_cont_funding_entity_item_id'}, foreign_key: true
  end
end

