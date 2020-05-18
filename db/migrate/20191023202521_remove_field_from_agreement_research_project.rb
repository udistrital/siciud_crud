class RemoveFieldFromAgreementResearchProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :agreement_research_projects, :year, :date
  end
end
