class CreatePlanPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_periods do |t|
      t.string :description
      t.integer :planable_id
      t.string :planable_type
      t.references :planable, polymorphyc: true, foreign_key: true

      t.timestamps
    end
  end
end