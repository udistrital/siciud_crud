class AddOasResearcherIdToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :oas_researcherId, :integer
  end
end
