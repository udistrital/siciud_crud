class RemoveOasResearcherIdFromResearchers < ActiveRecord::Migration[5.2]
  def change
    remove_column :researchers, :oas_researcherId, :integer
    add_column :researchers, :oas_researcherId, :string
  end
end
