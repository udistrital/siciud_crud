class RemoveFieldFromMemberSeedbed < ActiveRecord::Migration[5.2]
  def change
    remove_column :member_seedbeds, :initialDate, :date
    remove_column :member_seedbeds, :finalDate, :date
    remove_reference :member_seedbeds, :researcher_type_id, foreign_key: true
  end
end
