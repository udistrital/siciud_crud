class CreateExtParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :ext_participants do |t|
      t.string :first_name
      t.string :last_name
      t.references :producible, polymorphic: true
      t.references :participant_type, foreign_key: true

      t.timestamps
    end
  end
end
