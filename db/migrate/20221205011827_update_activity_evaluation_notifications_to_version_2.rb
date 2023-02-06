class UpdateActivityEvaluationNotificationsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :activity_evaluation_notifications, version: 2, revert_to_version: 1
  end
end
