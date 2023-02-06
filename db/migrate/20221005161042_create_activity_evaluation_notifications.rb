class CreateActivityEvaluationNotifications < ActiveRecord::Migration[5.2]
  def change
    create_view :activity_evaluation_notifications
  end
end
