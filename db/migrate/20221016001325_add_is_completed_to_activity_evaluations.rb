class AddIsCompletedToActivityEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_evaluations, :is_completed, :boolean, default: false

    change_column_default :activity_evaluations, :notified_due_to_expire, false
    change_column_default :activity_evaluations, :notified_expired, false
  end
end
