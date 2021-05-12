class AddPTypesFromSubtypeToExtParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :ext_participants, :participant_type_id, :bigint
    add_index :ext_participants, :participant_type_id
    add_foreign_key :ext_participants, :subtypes, column: :participant_type_id, primary_key: :id
  end
end
