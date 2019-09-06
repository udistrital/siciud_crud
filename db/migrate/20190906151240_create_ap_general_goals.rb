class CreateApGeneralGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :ap_general_goals do |t|
      t.text :goal
      t.references :agreement_research_project, foreign_key: true

      t.timestamps
    end
  end
end
