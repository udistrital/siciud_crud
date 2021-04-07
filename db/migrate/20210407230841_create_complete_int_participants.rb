class CreateCompleteIntParticipants < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_int_participants
  end
end
