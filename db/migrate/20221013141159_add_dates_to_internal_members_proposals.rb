class AddDatesToInternalMembersProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :internal_members_proposals, :start_date, :date
    add_column :internal_members_proposals, :end_date, :date
  end
end
