class CreateCompleteExtParticipants < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_ext_participants
  end
end
