class CreateApActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :ap_activities do |t|
      t.text :activity
      t.references :ap_specific_goal, foreign_key: true

      t.timestamps
    end
  end
end
