class RemoveFieldFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :ResearcherType_id, :integer
  end
end
