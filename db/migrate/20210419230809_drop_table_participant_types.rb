class DropTableParticipantTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :participant_types
  end
end
