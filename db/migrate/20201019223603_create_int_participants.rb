class CreateIntParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :int_participants do |t|
      t.references :producible, polymorphic: true
      t.references :research_group, foreign_key: true
      t.references :participant_type, foreign_key: true

      t.timestamps
    end
  end
end
