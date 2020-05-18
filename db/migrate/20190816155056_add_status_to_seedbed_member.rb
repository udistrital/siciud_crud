class AddStatusToSeedbedMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :seedbed_members, :state_researcher, foreign_key: true
  end
end
