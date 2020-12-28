class RemoveResearcherFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :researcher, foreign_key: true
  end
end
