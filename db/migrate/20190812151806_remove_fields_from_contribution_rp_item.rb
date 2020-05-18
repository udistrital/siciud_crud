class RemoveFieldsFromContributionRpItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contribution_rp_items, :contribution, foreign_key: true
    remove_reference :contribution_rp_items, :item_category, foreign_key: true
  end
end
