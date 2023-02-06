class CreateCompleteActivityEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_activity_evaluations
  end
end
