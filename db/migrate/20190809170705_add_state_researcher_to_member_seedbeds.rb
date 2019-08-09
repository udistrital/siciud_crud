class AddStateResearcherToMemberSeedbeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :member_seedbeds, :state_researcher, foreign_key: true
  end
end
