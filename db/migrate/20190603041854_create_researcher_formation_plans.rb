class CreateResearcherFormationPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :researcher_formation_plans do |t|
      t.string :activity
      t.text :description
      t.text :goal
      t.references :Period, foreign_key: true

      t.timestamps
    end
  end
end
