class AddPTypesFromSubtypeToIntParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :int_participants, :participant_type_id, :bigint
    add_index :int_participants, :participant_type_id
    add_foreign_key :int_participants, :subtypes, column: :participant_type_id, primary_key: :id
  end
end
