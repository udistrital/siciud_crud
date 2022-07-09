class UpdateCompleteProposalsByIntMembersToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_proposals_by_int_members, version: 3, revert_to_version: 2
  end
end
