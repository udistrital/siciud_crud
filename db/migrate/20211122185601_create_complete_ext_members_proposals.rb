class CreateCompleteExtMembersProposals < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_ext_members_proposals
  end
end
