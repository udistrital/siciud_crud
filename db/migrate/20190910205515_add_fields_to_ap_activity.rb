class AddFieldsToApActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :ap_activities, :weight, :integer
    add_column :ap_activities, :completedPercentage, :integer
  end
end
