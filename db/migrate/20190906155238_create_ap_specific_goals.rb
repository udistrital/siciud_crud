class CreateApSpecificGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :ap_specific_goals do |t|
      t.text :goal
      t.references :ap_general_goal, foreign_key: true

      t.timestamps
    end
  end
end
