class AddFieldsToApGeneralGoal < ActiveRecord::Migration[5.2]
  def change
    add_column :ap_general_goals, :completedPercentage, :integer
  end
end
