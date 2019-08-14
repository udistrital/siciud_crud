class AddEmailToResearchSeedbed < ActiveRecord::Migration[5.2]
  def change
    add_column :research_seedbeds, :email, :string
  end
end
