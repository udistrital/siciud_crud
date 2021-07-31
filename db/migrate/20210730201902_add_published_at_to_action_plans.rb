class AddPublishedAtToActionPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :action_plans, :published_at, :datetime
  end
end
