class CreateCompleteIntMembersProposals < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_int_members_proposals
  end
end
