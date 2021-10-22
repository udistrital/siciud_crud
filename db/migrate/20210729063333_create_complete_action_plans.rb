class CreateCompleteActionPlans < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_action_plans
  end
end
