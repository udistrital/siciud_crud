class UpdateCompleteActivityEvaluationsToVersion2 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_activity_evaluations, version: 2, revert_to_version: 1
  end
end
