class RemoveFieldsFromMemberSeedbed < ActiveRecord::Migration[5.2]
  def change
    remove_reference :member_seedbeds, :researcher_type, foreign_key: true
  end
end
