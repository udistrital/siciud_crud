class AddOrcidIdToExtParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :ext_participants, :orcid_id, :string
  end
end
