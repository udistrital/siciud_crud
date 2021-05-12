class RemovePTypesFromIntParticipants < ActiveRecord::Migration[5.2]
  def change
    remove_reference :int_participants, :participant_type, foreign_key: true
  end
end
