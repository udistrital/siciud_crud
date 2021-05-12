class AddParticipationFromSubtypesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :participation_id, :bigint
    add_index :events, :participation_id
    add_foreign_key :events, :subtypes, column: :participation_id, primary_key: :id
  end
end
