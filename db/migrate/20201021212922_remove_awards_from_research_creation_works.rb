class RemoveAwardsFromResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :research_creation_works, :award, foreign_key: true
  end
end
