class CreateCompleteProposalsByIntMembers < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_proposals_by_int_members
  end
end
