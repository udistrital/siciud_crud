class RemoveFieldsFromSeedbedMember < ActiveRecord::Migration[5.2]
  def change
    remove_reference :seedbed_members, :state_reseacher, foreign_key: true
  end
end
