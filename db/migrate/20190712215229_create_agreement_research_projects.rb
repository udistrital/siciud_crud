class CreateAgreementResearchProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :agreement_research_projects do |t|
      t.string :code
      t.date :year
      t.date :startDate
      t.date :approbationDate
      t.date :estimatedFinishDate
      t.date :closingDate
      t.references :researchGroup, foreign_key: true
      t.references :agreement, foreign_key: true

      t.timestamps
    end
  end
end
