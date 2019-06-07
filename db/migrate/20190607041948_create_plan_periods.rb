class CreatePlanPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_periods do |t|
      t.string :description
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
