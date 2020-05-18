class AddExecutedToContributionRpItem < ActiveRecord::Migration[5.2]
  def change
    add_column :contribution_rp_items, :executedCash, :float
    add_column :contribution_rp_items, :executedInKind, :float
    add_column :contribution_rp_items, :remainingCash, :float
    add_column :contribution_rp_items, :remainingInKind, :float
  end
end
