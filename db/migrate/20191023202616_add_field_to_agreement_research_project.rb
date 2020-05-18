class AddFieldToAgreementResearchProject < ActiveRecord::Migration[5.2]
  def change
    add_column :agreement_research_projects, :year, :string
  end
end
