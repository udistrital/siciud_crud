class RemovePTypesFromExtParticipants < ActiveRecord::Migration[5.2]
  def change
    remove_reference :ext_participants, :participant_type, foreign_key: true
  end
end
