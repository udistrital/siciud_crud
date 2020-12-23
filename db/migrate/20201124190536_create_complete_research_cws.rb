class CreateCompleteResearchCws < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_research_cws
  end
end
