class AddCompromisedToContributionRpItem < ActiveRecord::Migration[5.2]
  def change
    add_column :contribution_rp_items, :compromisedCash, :float
    add_column :contribution_rp_items, :compromisedInKind, :float
  end
end
