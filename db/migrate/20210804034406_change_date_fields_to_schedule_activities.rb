class ChangeDateFieldsToScheduleActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :schedule_activities, :sa_start_date, :date
    add_column :schedule_activities, :sa_end_date, :date
  end
end
