class AddFieldsToApSpecificGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :ap_specific_goals, :weight, :integer
    add_column :ap_specific_goals, :completedPercentage, :integer
  end
end
