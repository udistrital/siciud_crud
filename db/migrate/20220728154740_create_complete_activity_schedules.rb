class CreateCompleteActivitySchedules < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_activity_schedules
  end
end
