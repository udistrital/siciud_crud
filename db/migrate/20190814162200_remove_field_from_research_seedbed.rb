class RemoveFieldFromResearchSeedbed < ActiveRecord::Migration[5.2]
  def change
    remove_column :research_seedbeds, :mail, :string
  end
end
