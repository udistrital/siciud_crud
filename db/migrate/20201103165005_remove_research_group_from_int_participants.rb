class RemoveResearchGroupFromIntParticipants < ActiveRecord::Migration[5.2]
  def change
    remove_reference :int_participants, :research_group, foreign_key: true
  end
end
