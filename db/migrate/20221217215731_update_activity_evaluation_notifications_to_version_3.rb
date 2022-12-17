class UpdateActivityEvaluationNotificationsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :activity_evaluation_notifications, version: 3, revert_to_version: 2
  end
end
