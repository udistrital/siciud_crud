class CreateParticipantTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
