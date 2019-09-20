class CreateArpActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_activities do |t|
      t.text :activity
      t.references :arp_specific_goal, foreign_key: true
      t.float :completedPercentage

      t.timestamps
    end
  end
end
