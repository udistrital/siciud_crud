class AddActiveToNextTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :next_tasks, :active, :boolean, default: true
  end
end
