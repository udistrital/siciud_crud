class RemoveFieldsFromMemberSeedbeds < ActiveRecord::Migration[5.2]
  def change
    remove_reference :member_seedbeds, :state_reseacher, foreign_key: true
  end
end
