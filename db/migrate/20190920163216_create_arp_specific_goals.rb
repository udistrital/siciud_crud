class CreateArpSpecificGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_specific_goals do |t|
      t.text :goal
      t.references :arp_general_goal, foreign_key: true
      t.float :completedPercentage
      t.integer :weight

      t.timestamps
    end
  end
end
