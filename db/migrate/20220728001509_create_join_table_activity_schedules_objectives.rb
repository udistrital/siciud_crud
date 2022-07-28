class CreateJoinTableActivitySchedulesObjectives < ActiveRecord::Migration[5.2]
  def change
    create_join_table :activity_schedules, :objectives do |t|
      # t.index [:activity_schedule_id, :objective_id]
      # t.index [:objective_id, :activity_schedule_id]
    end
  end
end
