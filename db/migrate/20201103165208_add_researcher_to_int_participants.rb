class AddResearcherToIntParticipants < ActiveRecord::Migration[5.2]
  def change
    add_reference :int_participants, :researcher, foreign_key: true
  end
end
