class AddAgreementResearchProjectToArpActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :arp_activities, :agreement_research_project, foreign_key: true
  end
end
