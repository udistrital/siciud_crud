class AddStateResearcherToMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :state_researcher, foreign_key: true
  end
end
