class AddNameToAgreementResearchProject < ActiveRecord::Migration[5.2]
  def change
    add_column :agreement_research_projects, :name, :string
  end
end
