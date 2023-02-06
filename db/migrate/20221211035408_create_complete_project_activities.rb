class CreateCompleteProjectActivities < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_project_activities
  end
end
