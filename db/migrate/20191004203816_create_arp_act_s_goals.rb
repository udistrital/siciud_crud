class CreateArpActSGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_act_s_goals do |t|
      t.integer :weight
      t.references :arp_activity, foreign_key: true
      t.references :arp_specific_goal, foreign_key: true

      t.timestamps
    end
  end
end
